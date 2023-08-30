part of 'cubit.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginFailedState extends LoginStates {
  final String msg;
  LoginFailedState({required this.msg});
}

class LoginSuccessState extends LoginStates {
  final String msg;
  LoginSuccessState({required this.msg});
}
