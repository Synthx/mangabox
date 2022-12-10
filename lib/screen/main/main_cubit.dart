import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit()
      : super(const MainScreenState(
          index: 0,
        ));
}
