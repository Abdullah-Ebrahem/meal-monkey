import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit getObject(context) => BlocProvider.of(context);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  List<Map<String, dynamic>> users = [
    {'email': 'Abdullah@gmail.com', 'password': "123"},
    {'email': 'Amr@gmail.com', 'password': "456"},
  ];

  bool login() {
    final email = emailController.text;
    final password = passwordController.text;

    if (checkLogin(email, password) != null) {
      return true;
    } else {
      return false;
    }
  }

  bool? checkLogin(email, password) {
    for (var element in users) {
      if (element['email'] == email && element['password'] == password) {
        return true;
      }
    }
    return null;
  }
}
