import 'package:e_medicine/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

class LoginWithEmailPasswordParams extends Equatable {
  const LoginWithEmailPasswordParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class LoginWithEmailPasswordUseCase {
  LoginWithEmailPasswordUseCase(this._repository);
  final AuthRepository _repository;

  Future<void> call(LoginWithEmailPasswordParams params) async {
    return await _repository.loginWithEmailPassword(params);
  }
}