import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return _auth.userChanges().first;
  }

  Future<User> signIn() async {
    final credentials = await _auth.signInAnonymously();
    return credentials.user!;
  }
}
