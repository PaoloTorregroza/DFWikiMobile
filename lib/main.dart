import 'package:df_wiki/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DFWiki());
}

class DFWiki extends StatelessWidget {
  const DFWiki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const DFHome(),
    );
  }
}
