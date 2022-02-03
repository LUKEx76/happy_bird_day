import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var colorPalette = ColorPalette(
  Color(0xFF9e579d),
  Color(0xFFfc85ae),
  Color(0xFF574b90),
  Color(0xFF303a52),
  Color(0xFFaed581),
  Color(0xFF4fc3f7),
  Color(0xFFffb74d),
  Color(0xFFe57373),
);

var birdDayThemeData = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: MaterialColor(0xFF9e579d, swatch),
    brightness: Brightness.dark,
    accentColor: colorPalette.primaryColor,
  ),
  indicatorColor: colorPalette.primaryColor,
  scaffoldBackgroundColor: colorPalette.backgroundColor,
  errorColor: Colors.red,
  appBarTheme: AppBarTheme(backgroundColor: Colors.grey[900]),
  textTheme: GoogleFonts.latoTextTheme(
    ThemeData(brightness: Brightness.dark).textTheme,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: colorPalette.primaryColor,
    foregroundColor: Colors.white,
  ),
);

class ColorPalette {
  final Color primaryColor;
  final Color lightAccentColor;
  final Color darkAccentColor;
  final Color backgroundColor;
  final Color successColor;
  final Color infoColor;
  final Color warningColor;
  final Color errorColor;

  ColorPalette(
      this.primaryColor,
      this.lightAccentColor,
      this.darkAccentColor,
      this.backgroundColor,
      this.successColor,
      this.infoColor,
      this.warningColor,
      this.errorColor);
}

Map<int, Color> swatch = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};
