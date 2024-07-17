import 'package:e_medicine/data/datasource/auth_datasource.dart';
import 'package:e_medicine/domain/repository/auth_repository.dart';
import 'package:e_medicine/domain/use_case/auth_use_case/is_logged_use_case.dart';
import 'package:e_medicine/domain/use_case/auth_use_case/login_with_email_password_use_case.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._dataSource);
  final AuthDataSource _dataSource;

  @override
  Future<void> loginWithEmailPassword(LoginWithEmailPasswordParams params) async {
    try {
      return await _dataSource.loginWithEmailPassword(params);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isLogged(IsLoggedParams params) async {
    try {
      return await _dataSource.isLogged(params);
    } catch (e) {
      rethrow;
    }
  }

}