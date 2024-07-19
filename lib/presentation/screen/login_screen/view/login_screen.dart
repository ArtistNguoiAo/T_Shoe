import 'package:e_medicine/core/common/text_field_common.dart';
import 'package:e_medicine/core/helper/dialog_helper.dart';
import 'package:e_medicine/core/route/app_route.dart';
import 'package:e_medicine/core/utils/color_utils.dart';
import 'package:e_medicine/core/utils/media_utils.dart';
import 'package:e_medicine/core/utils/text_style_utils.dart';
import 'package:e_medicine/core/utils/text_utils.dart';
import 'package:e_medicine/presentation/screen/login_screen/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var _isRememberMe = false;
  var _isHintPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit()..init(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginLoaded) {
            _emailController.text = state.email;
            _passwordController.text = state.password;
            _isRememberMe = state.rememberMe;
          }
          if(state is LoginLoginSuccess) {
            DialogHelper.hideLoadingDialog(context);
            Navigator.pushNamed(context, AppRoutes.home);
            //Navigator.pushReplacementNamed(context, '/login');
          }
          if(state is LoginLoading) {
            DialogHelper.showLoadingDialog(context);
          }
          if(state is LoginError) {
            DialogHelper.hideLoadingDialog(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: _body(context),
          );
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    LoginState state = context.select((LoginCubit cubit) => cubit.state);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _logo(),
              _sizeBoxHeight(48),
              _emailTextField(),
              _sizeBoxHeight(16),
              _passwordTextField(),
              _rememberMeCheckbox(),
              if(state is LoginError) ...[
                _errorText(state.message),
              ],
              _buttonLogin(context),
              _sizeBoxHeight(48),
              _buttonRegister(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return SvgPicture.asset(
      MediaUtils.imgLogo,
      width: 160,
      height: 160,
    );
  }

  Widget _emailTextField() {
    return TextFieldCommon(
      style: TextStyleUtils.textStyleMuseoS16W400Black,
      hintText: TextUtils.email,
      prefixIcon: const Icon(
        FontAwesomeIcons.at,
        color: ColorUtils.primaryColor,
      ),
      controller: _emailController,
    );
  }

  Widget _passwordTextField() {
    return TextFieldCommon(
      hintText: TextUtils.password,
      style: TextStyleUtils.textStyleMuseoS18W500Black,
      prefixIcon: const Icon(
        FontAwesomeIcons.lock,
        color: ColorUtils.primaryColor,
      ),
      controller: _passwordController,
      obscureText: _isHintPassword,
      suffixIcon: InkWell(
        onTap: () {
          setState(() {
            _isHintPassword = !_isHintPassword;
          });
        },
        splashColor: ColorUtils.transparent,
        child: _isHintPassword
            ? const Icon(
                FontAwesomeIcons.eyeSlash,
                color: ColorUtils.primaryColor,
              )
            : const Icon(
                FontAwesomeIcons.eye,
                color: ColorUtils.primaryColor,
              ),
      ),
    );
  }

  Widget _sizeBoxHeight(double height) {
    return SizedBox(height: height);
  }

  Widget _buttonLogin(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<LoginCubit>().login(
          email: _emailController.text,
          password: _passwordController.text,
          rememberMe: _isRememberMe,
        );
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        decoration: BoxDecoration(
          color: ColorUtils.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          border: Border.all(color: Colors.red, width: 4),
        ),
        child: Text(
          TextUtils.login,
          style: TextStyleUtils.textStyleMuseoS20W600White,
        ),
      ),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          TextUtils.accountHint,
          style: TextStyleUtils.textStyleMuseoS16W400Black,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            TextUtils.register,
            style: TextStyleUtils.textStyleMuseoS16W400Primary,
          ),
        ),
      ],
    );
  }

  Widget _errorText(String message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Text(
        message,
        style: TextStyleUtils.textStyleMuseoS16W400Red,
      ),
    );
  }

  Widget _rememberMeCheckbox() {
    return Row(
      children: [
        Expanded(child: Container()),
        Text(
          TextUtils.rememberMe,
          style: TextStyleUtils.textStyleMuseoS16W400Black,
        ),
        Checkbox(
          value: _isRememberMe,
          onChanged: (value) {
            setState(() {
              _isRememberMe = value!;
            });
          },
          activeColor: ColorUtils.primaryColor,
        ),

      ],
    );
  }
}
