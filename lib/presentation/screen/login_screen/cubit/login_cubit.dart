import 'package:bloc/bloc.dart';
import 'package:e_medicine/core/di/config_di.dart';
import 'package:e_medicine/core/utils/text_utils.dart';
import 'package:e_medicine/domain/use_case/auth_use_case/login_with_email_password_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginWithEmailPasswordUseCase _loginWithEmailPasswordUseCase = ConfigDI().injector.get();

  Future<void> init() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? savedEmail = prefs.getString('saved_email');
      String? savedPassword = prefs.getString('saved_password');
      bool? savedRememberMe = prefs.getBool('saved_remember_me');
      emit(LoginLoaded(
        email: savedEmail ?? '',
        password: savedPassword ?? '',
        rememberMe: savedRememberMe ?? false
      ));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  Future<void> login({required String email, required String password, required bool rememberMe}) async {
    emit(LoginLoading());
    if(email.isEmpty || password.isEmpty) {
      emit(LoginError(TextUtils.emptyError));
    }
    else {
      try {
        await _loginWithEmailPasswordUseCase(
          LoginWithEmailPasswordParams(email: email, password: password, rememberMe: rememberMe)
        );
        emit(LoginLoginSuccess());
      }
      catch(e) {
        if(e is FirebaseAuthException) {
          emit(LoginError(e.message.toString()));
        }
        else {
          emit(LoginError(e.toString()));
        }
      }
    }
  }
}
