import 'package:flutter/material.dart';

class TextStyles {
  static const String _fontFamily = 'Times New Roman';

  static const subtitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
  );

  static const titleDimmed = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    color: Colors.grey,
  );

  static const paragraphDimmed = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: Colors.grey,
  );

  static const paragraph = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 15,
  );
}
