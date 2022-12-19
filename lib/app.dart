import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/screen/screen.dart';
import 'package:mangabox/store/store.dart';
import 'package:mangabox/theme/theme.dart';

class MangaBox extends StatelessWidget {
  const MangaBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(authService: getIt())),
        BlocProvider(create: (context) => DeviceCubit()),
      ],
      child: MaterialApp(
        title: 'MangaBox',
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        darkTheme: dartThemeData,
        themeMode: ThemeMode.dark,
        home: const SplashScreen(),
      ),
    );
  }
}
