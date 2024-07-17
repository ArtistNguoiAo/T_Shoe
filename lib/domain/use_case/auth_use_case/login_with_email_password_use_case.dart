import 'package:e_medicine/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

class LoginWithEmailPasswordParams extends Equatable {
  const LoginWithEmailPasswordParams({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  final String email;
  final String password;
  final bool rememberMe;

  @override
  List<Object> get props => [email, password, rememberMe];
}

class LoginWithEmailPasswordUseCase {
  LoginWithEmailPasswordUseCase(this._repository);
  final AuthRepository _repository;

  Future<void> call(LoginWithEmailPasswordParams params) async {
    return await _repository.loginWithEmailPassword(params);
  }
}