import 'package:e_medicine/domain/use_case/auth_use_case/login_with_email_password_use_case.dart';

abstract class AuthRepository {
  Future<void> loginWithEmailPassword(LoginWithEmailPasswordParams params);
}