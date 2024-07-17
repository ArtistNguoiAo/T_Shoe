import 'package:e_medicine/domain/use_case/auth_use_case/login_with_email_password_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> loginWithEmailPassword(LoginWithEmailPasswordParams params) async {
    final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}