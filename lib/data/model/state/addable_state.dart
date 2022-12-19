import 'package:freezed_annotation/freezed_annotation.dart';

part 'addable_state.freezed.dart';

@freezed
class AddableState<T> with _$AddableState<T> {
  const factory AddableState({
    required T content,
    @Default(false) bool owned,
    @Default(false) bool loading,
  }) = _AddableState<T>;
}
