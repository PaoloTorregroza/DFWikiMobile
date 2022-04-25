import 'dart:developer';

import 'package:df_wiki/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:fwfh_cached_network_image/fwfh_cached_network_image.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:dio/dio.dart';

import '../api/page_response.dart';

class DFEntry extends StatefulWidget {
  const DFEntry({Key? key, required this.page}) : super(key: key);

  final String page;

  @override
  State<DFEntry> createState() => _DFEntryState();
}

class _DFEntryState extends State<DFEntry> {
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
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: HtmlWidget(
              pageContent,
              factoryBuilder: () => DFPageFactory(),
              textStyle: TextStyles.paragraph,
              customStylesBuilder: (el) {
                if (el.classes.contains('keyboard-key')) {
                  return {'color': 'black'};
                }

                return {'margin-left': '0', 'margin-right': '0'};
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
            .replaceAll('width: 35%', 'width: 100%')
            .replaceAll('width: 45%', 'width: 100%')
            .replaceAll('width: 80%', 'width: 100%')
            .replaceAll('margin: 1em', 'margin: 0');
        pageContent = html;
      });
    } catch (e) {
      print(e);
    }
  }
}

class DFPageFactory extends WidgetFactory with CachedNetworkImageFactory {}
