import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'states.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupIntialState());

  static SignupCubit getObject(context) => BlocProvider.of(context);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final adrressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void register() {
    if (formKey.currentState!.validate()) {
      //send request
    }
  }
}
