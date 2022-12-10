import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    required int index,
  }) = _MainScreenState;
}
