import 'package:e_medicine/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

class IsLoggedParams extends Equatable {
  const IsLoggedParams();

  @override
  List<Object> get props => [];
}

class IsLoggedUseCase {
  IsLoggedUseCase(this._repository);
  final AuthRepository _repository;

  Future<bool> call(IsLoggedParams params) async {
    return await _repository.isLogged(params);
  }
}