import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/methods.dart';
import 'package:flutter_application_1/core/proj_button.dart';
import 'package:flutter_application_1/core/proj_input.dart';
import 'package:flutter_application_1/screens/login/view.dart';
import 'package:flutter_application_1/screens/signup/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignupCubit(),
        child: Builder(builder: (context) {
          final cubit = SignupCubit.getObject(context);
          return SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(
                    height: 60.h,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: const Color(0xff4A4B4D),
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Add your details to sign up',
                    style: TextStyle(
                        color: const Color(0xff7C7D7E), fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  ProjInput(
                    keyBoardType: TextInputType.name,
                    hintText: 'name',
                    controller: cubit.nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required';
                      }
                      return null;
                    },
                  ),
                  ProjInput(
                      keyBoardType: TextInputType.emailAddress,
                      controller: cubit.emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        }
                        return null;
                      },
                      hintText: 'Email'),
                  ProjInput(
                      keyBoardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        }
                        return null;
                      },
                      controller: cubit.mobileController,
                      hintText: 'Mobile No'),
                  ProjInput(
                      keyBoardType: TextInputType.streetAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        }
                        return null;
                      },
                      controller: cubit.adrressController,
                      hintText: 'Address'),
                  ProjInput(
                      keyBoardType: TextInputType.visiblePassword,
                      isPassword: true,
                      hidden: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        }
                        return null;
                      },
                      controller: cubit.passwordController,
                      hintText: 'Password'),
                  ProjInput(
                    keyBoardType: TextInputType.visiblePassword,
                    isPassword: true,
                    hidden: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required';
                      } else if (value != cubit.passwordController.text) {
                        return 'write the same password';
                      }
                      return null;
                    },
                    controller: cubit.confirmPasswordController,
                    hintText: 'Confirm Password',
                    isLastInput: true,
                  ),
                  BlocConsumer<SignupCubit, SignupStates>(
                      listener: (context, state) {
                    if (state is SignupFaildState) {
                      showMsg(msg: state.msg);
                    } else if (state is SignupSuccessState) {
                      showMsg(msg: state.msg);
                    }
                  }, builder: (context, state) {
                    if (state is SignupLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return ProjButton(
                      title: 'Sign Up',
                      onPress: () {
                        cubit.register();
                      },
                    );
                  }),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Already have an Account?',
                        style: TextStyle(
                            color: const Color(0xff7C7D7E), fontSize: 14.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(
                              page: const LoginScreen(), withHistory: false);
                        },
                        child: Text(
                          ' Login',
                          style: TextStyle(
                              color: const Color(0xffFC6011),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
