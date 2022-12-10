import 'package:flutter/material.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/theme/theme.dart';

class MangaBox extends StatelessWidget {
  const MangaBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MangaBox',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      darkTheme: dartThemeData,
      themeMode: ThemeMode.dark,
      home: const MainScreen(),
    );
  }
}
