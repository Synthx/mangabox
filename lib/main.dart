import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:mangabox/app.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/firebase_options.dart';

const _defaultLocale = 'fr_FR';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjector();

  Logger.root.level = kDebugMode ? Level.ALL : Level.INFO;
  Intl.defaultLocale = _defaultLocale;
  Bloc.observer = StateObserver();

  await Future.wait([
    initializeDateFormatting(_defaultLocale),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  ]);

  runApp(const MangaBox());
}
