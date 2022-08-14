import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final ThemeData lightTheme = ThemeData(
  backgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: HexColor('#313131'),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
  primaryColor: HexColor('#313131'),
  secondaryHeaderColor: Colors.white,
  fontFamily: ('PTMono'),
);
