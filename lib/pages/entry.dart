import 'dart:developer';

import 'package:df_wiki/styles/text.dart';
import 'package:df_wiki/utils/custom_shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fwfh_cached_network_image/fwfh_cached_network_image.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/page_response.dart';
import '../styles/slide_animation.dart';

class DFEntry extends StatefulWidget {
  const DFEntry({Key? key, required this.page}) : super(key: key);

  final String page;

  @override
  State<DFEntry> createState() => _DFEntryState();
}

class _DFEntryState extends State<DFEntry> {
  CustomSharedPreferences prefs = CustomSharedPreferences();
  String pageContent = '';

  @override
  void initState() {
    super.initState();
    getPage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              widget.page,
              style: const TextStyle(fontFamily: 'Times New Roman'),
            ),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(
                    Icons.star_outline,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    prefs.addEntry(widget.page);
                  })
            ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: HtmlWidget(
              pageContent,
              factoryBuilder: () => DFPageFactory(),
              textStyle: TextStyles.paragraph,
              onLoadingBuilder: (context, element, loadingProgress) => SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: const CupertinoActivityIndicator(),
              ),
              customStylesBuilder: (el) {
                if (el.classes.contains('keyboard-key')) {
                  return {'color': 'black'};
                }

                return {'margin-left': '0', 'margin-right': '0'};
              },
              onTapUrl: (url) {
                Navigator.push(
                  context,
                  SlideInRoute(
                    page: DFEntry(
                      page: url.replaceAll('/index.php/', ''),
                    ),
                  ),
                );

                return Future(() => false);
              },
            ),
          ),
        ),
      ),
    );
  }

  void getPage() async {
    try {
      var response = await Dio().get(
          'https://dwarffortresswiki.org/api.php?action=parse&page=${widget.page}&format=json');

      PageResponse page = PageResponse.fromJson(response.data);
      setState(() {
        String html = page.parse.text.content
            .replaceAll('src="/', 'src="https://dwarffortresswiki.org/')
            .replaceAll('background: white', 'background: #484444')
            // Break html for prevent fixed widths in tables
            .replaceAll('width', '')
            .replaceAll('margin: 1em', 'margin: 0');
        pageContent = html;
      });
    } catch (e) {
      log('ENTRY ERROR: $e');
    }
  }
}

class DFPageFactory extends WidgetFactory with CachedNetworkImageFactory {}
