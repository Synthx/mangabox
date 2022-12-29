import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainScreenStore extends Cubit<MainScreenState> {
  MainScreenStore()
      : super(const MainScreenState(
          pageController: null,
          page: 0,
        ));

  void setPageController({
    required PageController pageController,
  }) {
    emit(state.copyWith(
      pageController: pageController,
    ));
  }

  void changePage({
    required int page,
  }) {
    state.pageController?.jumpToPage(page);
    emit(state.copyWith(page: page));
  }
}
