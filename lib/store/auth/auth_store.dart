import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';
import 'package:mangabox/data/data.dart';

import 'auth_state.dart';

class AuthStore extends Cubit<AuthState> {
  final AuthService authService;

  AuthStore({
    required this.authService,
  }) : super(AuthState(
          user: UserProfile.empty(),
        ));

  Future<void> init() async {
    var user = await authService.getCurrentUser();
    user ??= await authService.signIn();
    emit(state.copyWith(
      user: UserProfile(
        id: user.uid,
      ),
    ));
  }

  String get userId => state.user.id;
}
