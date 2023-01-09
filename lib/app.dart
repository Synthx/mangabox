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
        BlocProvider(create: (context) => AuthStore(authService: getIt())),
        BlocProvider(create: (context) => DeviceStore()),
      ],
      child: Builder(
        builder: (context) {
          return BlocProvider(
            create: (context) => CollectionStore(
              authStore: context.read(),
              collectionService: getIt(),
            ),
            child: MaterialApp(
              title: 'MangaBox',
              debugShowCheckedModeBanner: false,
              debugShowMaterialGrid: false,
              darkTheme: dartThemeData,
              themeMode: ThemeMode.dark,
              navigatorKey: navigatorKey,
              home: const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
