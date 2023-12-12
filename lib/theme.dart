import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color _lightPrimaryColor = Colors.blueGrey.shade50;
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.blue;

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkOnPrimaryColor = Colors.blueGrey;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _accentColorDark = Color.fromRGBO(74, 217, 217, 1);

  static const TextStyle _lightHeadingText = TextStyle(
    color: _lightTextColorPrimary,
  );

  static const TextStyle _lightBodyText = TextStyle(
    color: _lightTextColorPrimary,
  );

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadingText,
    bodyLarge: _lightBodyText,
  );

  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyeTextStyle =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkThemeHeadingTextStyle,
    bodyLarge: _darkThemeBodyeTextStyle,
  );

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: _lightPrimaryColor,
      appBarTheme: const AppBarTheme(
        color: _appbarColorLight,
      ),
      colorScheme: ColorScheme.light(
          primary: _lightPrimaryColor,
          onPrimary: _lightOnPrimaryColor,
          secondary: _accentColorDark),
      textTheme: _lightTextTheme, bottomAppBarTheme: const BottomAppBarTheme(color: _appbarColorLight));

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryColor,
      appBarTheme: AppBarTheme(
        color: _appbarColorDark,
      ),
      colorScheme: ColorScheme.dark(
        primary: _darkPrimaryColor,
        onPrimary: _darkOnPrimaryColor,
        secondary: _accentColorDark,
      ),
      textTheme: _darkTextTheme, bottomAppBarTheme: BottomAppBarTheme(color: _appbarColorDark));
}