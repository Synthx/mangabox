import 'package:get_it/get_it.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';

final getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton(() => BookService());
  getIt.registerLazySingleton(() => EditionService());
  getIt.registerLazySingleton(() => SeriesService());
  getIt.registerLazySingleton(() => AuthService());
}
