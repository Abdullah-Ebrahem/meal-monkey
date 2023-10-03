import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/cache_helper.dart';
import 'package:flutter_application_1/screens/signup/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'states.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupIntialState());

  static SignupCubit getObject(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final adrressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(SignupLoadingState());
      try {
        final response =
            await Dio(BaseOptions(receiveDataWhenStatusError: true))
                .post('https://roaya-lab.onrender.com/signUp', data: {
          'firstName': nameController.text,
          'lastName': nameController.text.split(' ').last,
          'email': emailController.text,
          'password': passwordController.text,
          'confirmPassword': confirmPasswordController.text
        });
        final data = UserRegister.fromJson(response.data);
        if (response.statusCode == 200) {
          CacheHelper.saveName(data.firstName);
          CacheHelper.saveEmail(data.email);
          emit(SignupSuccessState(msg: 'Success'));
        }
      } on DioException catch (e) {
        if (e.response != null) {
          emit(SignupFaildState(msg: e.response!.data['message']));
        } else {
          emit(SignupFaildState(msg: 'Server Error'));
        }
      }
    }
  }
}
