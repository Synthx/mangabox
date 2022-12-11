import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';

class StateObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log.fine('${bloc.runtimeType} - Change : ${change.nextState}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log.severe('${bloc.runtimeType} - Error', error, stackTrace);
  }
}
