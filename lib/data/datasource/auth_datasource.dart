import 'package:e_medicine/domain/use_case/auth_use_case/is_logged_use_case.dart';
import 'package:e_medicine/domain/use_case/auth_use_case/login_with_email_password_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> loginWithEmailPassword(LoginWithEmailPasswordParams params) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      String? token = await userCredential.user?.getIdToken() ;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token!);
      await prefs.setInt('token_expiration', DateTime.now().add(const Duration(hours: 24)).millisecondsSinceEpoch);

      if (params.rememberMe) {
        await prefs.setString('saved_email', params.email);
        await prefs.setString('saved_password', params.password);
        await prefs.setBool('saved_remember_me', true);
      } else {
        await prefs.remove('saved_email');
        await prefs.remove('saved_password');
        await prefs.remove('saved_remember_me');
      }
    }
    catch (e) {
      rethrow;
    }
  }

  Future<bool> isLogged(IsLoggedParams params) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int? tokenExpiration = prefs.getInt('token_expiration');

    if (token != null && tokenExpiration != null) {
      if (DateTime.now().millisecondsSinceEpoch < tokenExpiration) {
        // Token is still valid
        return true;
      } else {
        // Token expired
        await prefs.remove('token');
        await prefs.remove('token_expiration');
      }
    }
    return false;
  }
}