import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF800080);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.red
];

class AppTheme {
  final int colorSelected;

  AppTheme(this.colorSelected):assert(colorSelected >= 0 && colorSelected < _colorThemes.length, 'The color selected must be between 0 to ${_colorThemes.length}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[colorSelected],
      //brightness: Brightness.dark
    );
  }

}