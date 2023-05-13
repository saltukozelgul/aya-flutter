import 'package:flutter/material.dart';

import '../constants/other/colors.dart';
import '../constants/style/ui_styles.dart';

class DarkTheme {
  late final ThemeData darkTheme;
  late Color? contrastColor = colorBlack;

  DarkTheme() {
    darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: colorDarkThemeBackground100,
      colorScheme: _colorScheme(),
      primaryColor: colorPrimaryDark,
      textTheme: _textThemes(),
      cardColor: colorDarkThemeBackground75,
      elevatedButtonTheme: _elevatedButtonThemeData(),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: colorTransparent)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: colorTransparent)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: colorRed)),
        filled: true,
        fillColor: colorDarkThemeBackground75,
        focusColor: colorDarkThemeBackground75,
        hoverColor: colorDarkThemeBackground75,
      ),
    );
  }
}

ElevatedButtonThemeData _elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  );
}

ColorScheme _colorScheme() {
  return const ColorScheme(
    brightness: Brightness.dark,
    primary: colorPrimaryDark,
    onPrimary: Colors.black,
    secondary: colorSecondry,
    onSecondary: Colors.black,
    error: Color(0xFFCF6679),
    onError: Colors.black,
    background: colorDarkThemeBackground100,
    onBackground: Colors.white,
    surface: colorDarkThemeBackground100,
    onSurface: Colors.white,
  );
}

TextTheme _textThemes() {
  return TextTheme(
    // Gölgeli ve kalın basliklar icin display'ler kullanılacak.
    displaySmall: TextStyle(
      shadows: UIStyles().titleShadow(),
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'BalooBhaina',
    ),

    displayMedium: TextStyle(
      shadows: UIStyles().titleShadow(),
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'BalooBhaina',
    ),

    displayLarge: TextStyle(
      shadows: UIStyles().titleShadow(),
      fontSize: 28,
      fontWeight: FontWeight.bold,
      fontFamily: 'BalooBhaina',
    ),

    // Gölgesiz ve kalın basliklar icin title'lar kullanılacak.

    titleLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: 'ABeeZee',
    ),

    titleMedium: const TextStyle(
      color: Color.fromARGB(255, 104, 104, 104),
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'ABeeZee',
    ),

    titleSmall: const TextStyle(
      color: colorGrey,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'ABeeZee',
      fontStyle: FontStyle.italic,
    ),

    headlineMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: 'ABeeZee',
    ),

    headlineSmall: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: 'ABeeZee',
    ),

    headlineLarge: const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w800,
      fontFamily: 'ABeeZee',
    ),

    // App'in kalan her yerinde kullanılacak olan body textler.
    bodyLarge: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: 'ABeeZee',
    ),

    bodyMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'ABeeZee',
    ),

    bodySmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'ABeeZee',
    ),
  );
}
