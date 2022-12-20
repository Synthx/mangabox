import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
  }) = _UserProfile;

  factory UserProfile.empty() => const UserProfile(id: '');
}
