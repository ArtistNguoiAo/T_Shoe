import 'package:bloc/bloc.dart';
import 'package:e_medicine/core/di/config_di.dart';
import 'package:e_medicine/domain/use_case/auth_use_case/is_logged_use_case.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  final IsLoggedUseCase _isLoggedUseCase = ConfigDI().injector.get();
  
  Future<void> init() async {
    emit(SplashLoaded());
    await Future.delayed(const Duration(milliseconds: 3000));
    final checkToken = await _isLoggedUseCase.call(const IsLoggedParams());
    emit(SplashSuccess(isLogged: checkToken));
  }
}
