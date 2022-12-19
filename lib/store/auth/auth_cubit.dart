import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangabox/core/core.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit({
    required this.authService,
  }) : super(const AuthState(
          user: null,
        ));

  Future<void> init() async {
    var user = await authService.getCurrentUser();
    user ??= await authService.signIn();
    emit(state.copyWith(user: user));
  }
}
