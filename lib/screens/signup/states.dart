part of 'cubit.dart';

abstract class SignupStates {}

class SignupIntialState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupFaildState extends SignupStates {
  final String msg;
  SignupFaildState({required this.msg});
}

class SignupSuccessState extends SignupStates {
  final String msg;
  SignupSuccessState({required this.msg});
}
