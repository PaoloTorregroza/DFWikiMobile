import 'dart:developer';

import 'package:df_wiki/api/search_response.dart';
import 'package:df_wiki/pages/entry.dart';
import 'package:df_wiki/styles/text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:df_wiki/components/df_icon_button.dart';
import 'package:df_wiki/styles/slide_animation.dart';

class DFSearch extends StatefulWidget {
  const DFSearch({Key? key}) : super(key: key);

  final String baseWikiPage = 'https://dwarffortresswiki.org/index.php/';

  @override
  State<DFSearch> createState() => _DFSearchState();
}

class _DFSearchState extends State<DFSearch> {
  String searchTerm = '';
  bool isLoading = false;
  SearchResponse searchData = SearchResponse.empty;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.black12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DFIconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Search',
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      cursorColor: Colors.white,
                      style: const TextStyle(fontFamily: 'Times New Roman'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(0),
                        fillColor: Colors.white10,
                        filled: true,
                        focusColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white38,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchTerm = value;
                        });
                      },
                      onSubmitted: (value) {
                        _searchPage();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: OutlinedButton(
                      child: const Text(
                        'Go!',
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        if (searchTerm.isNotEmpty) {
                          _searchPage();
                        }
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size.fromHeight(45),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isLoading
                      ? const Expanded(child: CupertinoActivityIndicator())
                      : searchData.search.isEmpty
                          ? const Expanded(
                              child: Center(
                                child: Text(
                                  'Nothing here',
                                  textAlign: TextAlign.center,
                                  style: TextStyles.paragraphDimmed,
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: searchData.links.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        SlideInRoute(
                                          page: DFEntry(
                                            page: searchData.results[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            searchData.results[index],
                                            style: TextStyles.subtitle,
                                          ),
                                          Text(
                                            searchData.links[index],
                                            style: TextStyles.paragraphDimmed,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _searchPage() async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      setState(() {
        isLoading = true;
      });
      var response = await Dio().get(
          'https://dwarffortresswiki.org/api.php?search=$searchTerm&action=opensearch&format=json&redirects=resolve&limit=11');
      var searchReponse = SearchResponse(
        search: response.data[0] as String,
        links: List<String>.from(response.data[3]),
        results: List<String>.from(response.data[1]),
      );

      setState(() {
        searchData = searchReponse;
        isLoading = false;
      });
    } catch (e) {
      log('SEARCH ERROR: $e');
    }
  }
}
