import 'package:freezed_annotation/freezed_annotation.dart';

part 'publisher.freezed.dart';

part 'publisher.g.dart';

@freezed
class Publisher with _$Publisher {
  const factory Publisher({
    required String id,
    required String name,
    required bool closed,
  }) = _Publisher;

  factory Publisher.fromJson(Map<String, dynamic> json) =>
      _$PublisherFromJson(json);
}
