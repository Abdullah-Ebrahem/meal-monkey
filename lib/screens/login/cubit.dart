import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/methods.dart';
import 'package:flutter_application_1/screens/login/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit getObject(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      try {
        final response =
            await Dio(BaseOptions(receiveDataWhenStatusError: true))
                .post('https://roaya-lab.onrender.com/login', data: {
          'email': emailController.text,
          'password': passwordController.text
        });
        final data = UserData.fromJson(response.data);
        if (response.statusCode == 200) {
          cacheData(
              firstName: data.user.firstName,
              lastName: data.user.lastName,
              email: data.user.email,
              token: data.token);
          emit(LoginSuccessState(msg: 'Success'));
        }
      } on DioException catch (e) {
        if (e.response != null) {
          emit(LoginFailedState(msg: e.response!.data['message'].toString()));
        } else {
          emit(LoginFailedState(msg: 'Server Error'));
        }
      }
    }
  }
}
