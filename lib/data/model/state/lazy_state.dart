import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lazy_state.freezed.dart';

@freezed
class LazyState<T> with _$LazyState<T> {
  const LazyState._();

  const factory LazyState({
    @Default([]) List<T> content,
    @Default(0) int total,
    @Default(false) bool loading,
    DocumentSnapshot? lastSnapshot,
  }) = _LazyState<T>;

  bool get canLoadMore {
    return content.length < total && !loading;
  }
}
