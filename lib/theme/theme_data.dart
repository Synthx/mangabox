import 'package:flutter/material.dart';
import 'package:mangabox/theme/theme.dart';

ThemeData themeData({
  required ThemeData base,
}) {
  return base.copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    backgroundColor: const Color(0xFF151517),
    scaffoldBackgroundColor: const Color(0xFF000000),
    cardColor: const Color(0xFF27272A),
    dividerColor: const Color(0xFF151517),
    errorColor: const Color(0xFFFF453A),
    primaryColor: const Color(0xFFBF5AF2),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFFBF5AF2),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      centerTitle: false,
      titleSpacing: kSpacer,
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xFF000000),
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.zero,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.all(const Color(0xFFBF5AF2)),
      side: const BorderSide(
        width: 0.65,
        color: Color(0xFF27272A),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        splashFactory: NoSplash.splashFactory,
        foregroundColor: const Color(0xFFBF5AF2),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF27272A),
      contentTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      actionTextColor: Color(0xFFFFFFFF),
    ),
    textTheme: base.textTheme.copyWith(
      displayLarge: base.textTheme.displayLarge?.copyWith(
        fontSize: 34,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
        color: const Color(0xFFFFFFFF),
      ),
      displayMedium: base.textTheme.displayMedium?.copyWith(
        fontSize: 28,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
        color: const Color(0xFFFFFFFF),
      ),
      displaySmall: base.textTheme.displayMedium?.copyWith(
        fontSize: 22,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.bold,
        color: const Color(0xFFFFFFFF),
      ),
      bodyLarge: base.textTheme.bodyMedium?.copyWith(
        fontSize: 17,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
        color: const Color(0x99EBEBF5),
      ),
      bodyMedium: base.textTheme.bodyMedium?.copyWith(
        fontSize: 17,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
        color: const Color(0x99EBEBF5),
      ),
      bodySmall: base.textTheme.bodySmall?.copyWith(
        fontSize: 15,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
        color: const Color(0x99EBEBF5),
      ),
      labelMedium: base.textTheme.caption?.copyWith(
        fontSize: 13,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
        color: const Color(0x99EBEBF5),
      ),
      labelSmall: base.textTheme.caption?.copyWith(
        fontSize: 11,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.normal,
        color: const Color(0x99EBEBF5),
      ),
    ),
  );
}
