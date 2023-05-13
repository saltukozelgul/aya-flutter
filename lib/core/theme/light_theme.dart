import 'package:flutter/material.dart';
import 'package:aya_project/core/constants/style/ui_styles.dart';

import '../constants/other/colors.dart';

class LightTheme {
  late final ThemeData lightTheme;
  late Color? contrastColor = colorBlack;

  LightTheme() {
    lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: colorLightThemeBackground,
      colorScheme: _colorScheme(),
      primaryColor: colorPrimary,
      textTheme: _textThemes(),
      elevatedButtonTheme: _elevatedButtonThemeData(),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: colorTransparent)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: colorTransparent)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: colorRed)),
        filled: true,
        fillColor: colorWhite,
        focusColor: colorWhite,
        hoverColor: colorWhite,
      ),
    );
  }

  ColorScheme _colorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: colorPrimary,
      onPrimary: colorPrimary,
      secondary: colorSecondry,
      onSecondary: colorSecondry,
      error: colorRed,
      onError: colorPrimary,
      background: colorLightThemeBackground,
      onBackground: colorPrimary,
      surface: colorPrimary,
      onSurface: colorPrimary,
    );
  }

  ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  TextTheme _textThemes() {
    return TextTheme(
      // Gölgeli ve kalın basliklar icin display'ler kullanılacak.
      displaySmall:
          TextStyle(shadows: UIStyles().titleShadow(), color: colorBlack, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'BalooBhaina'),

      displayMedium: TextStyle(
        shadows: UIStyles().titleShadow(),
        color: colorBlack,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'BalooBhaina',
      ),

      displayLarge: TextStyle(
        shadows: UIStyles().titleShadow(),
        color: colorBlack,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: 'BalooBhaina',
      ),

      // Gölgesiz ve kalın basliklar icin title'lar kullanılacak.

      titleLarge: const TextStyle(
        color: colorBlack,
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
        color: colorBlack,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'ABeeZee',
      ),

      headlineSmall: const TextStyle(
        color: colorBlack,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: 'ABeeZee',
      ),

      headlineLarge: const TextStyle(
        color: colorBlack,
        fontSize: 25,
        fontWeight: FontWeight.w800,
        fontFamily: 'ABeeZee',
      ),

      // App'in kalan her yerinde kullanılacak olan body textler.
      bodyLarge: const TextStyle(
        color: colorBlack,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'ABeeZee',
      ),

      bodyMedium: const TextStyle(
        color: colorBlack,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'ABeeZee',
      ),

      bodySmall: const TextStyle(
        color: colorBlack,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'ABeeZee',
      ),
    );
  }
}
