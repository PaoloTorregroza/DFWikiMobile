import 'package:df_wiki/pages/entry.dart';
import 'package:flutter/material.dart';
import 'package:df_wiki/styles/slide_animation.dart';

class DFSearch extends StatefulWidget {
  const DFSearch({Key? key}) : super(key: key);

  @override
  State<DFSearch> createState() => _DFSearchState();
}

class _DFSearchState extends State<DFSearch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: TextButton(
          child: const Text('Go to result'),
          onPressed: () {
            Navigator.push(
              context,
              SlideInRoute(
                page: const DFEntry(page: 'DF2014:Quickstart_guide'),
              ),
            );
          },
        ),
      ),
    );
  }
}
