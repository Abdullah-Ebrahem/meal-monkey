import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/methods.dart';
import 'package:flutter_application_1/core/proj_button.dart';
import 'package:flutter_application_1/core/proj_input.dart';
import 'package:flutter_application_1/screens/login/cubit.dart';
import 'package:flutter_application_1/screens/master/view.dart';
import 'package:flutter_application_1/screens/reset_password/view.dart';
import 'package:flutter_application_1/screens/signup/view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        final cubit = LoginCubit.getObject(context);
        return Scaffold(
          body: SingleChildScrollView(
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
                    'Login',
                    style: TextStyle(
                        color: const Color(0xff4A4B4D),
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Add your details to login',
                    style: TextStyle(
                        color: const Color(0xff7C7D7E), fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  ProjInput(
                    hintText: 'Your Email',
                    controller: cubit.emailController,
                    keyBoardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      } else if (!value.endsWith('@gmail.com')) {
                        return 'Email must end with @gmail.com';
                      }
                      return null;
                    },
                  ),
                  ProjInput(
                    hintText: 'Password',
                    controller: cubit.passwordController,
                    isLastInput: true,
                    isPassword: true,
                    hidden: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 8) {
                        return 'Password must be greater than 8 digits';
                      }
                      return null;
                    },
                  ),
                  BlocConsumer<LoginCubit, LoginStates>(
                    listener: (context, state) {
                      if (state is LoginFailedState) {
                        showMsg(msg: state.msg);
                      }
                      if (state is LoginSuccessState) {
                        navigateTo(
                            page: const MasterScreen(), withHistory: false);
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return const CircularProgressIndicator();
                      }
                      return ProjButton(title: 'Login', onPress: cubit.login);
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        navigateTo(
                            page: const ResetPassword(), withHistory: false);
                      },
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                            color: const Color(0xff7C7D7E), fontSize: 14.sp),
                      )),
                  SizedBox(
                    height: 49.sp,
                  ),
                  Text(
                    'or Login With',
                    style: TextStyle(
                        color: const Color(0xff7C7D7E), fontSize: 14.sp),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: 27.h, bottom: 28.h, start: 21.w, end: 21.w),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 56.h),
                            shape: const StadiumBorder(),
                            backgroundColor: const Color(0xff367FC0),
                            foregroundColor: Colors.white),
                        onPressed: () {},
                        icon: Padding(
                          padding: EdgeInsetsDirectional.only(end: 32.w),
                          child: Text(
                            'f',
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                        label: Text('Login with Facebook',
                            style: TextStyle(fontSize: 12.sp))),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 21.h, end: 21.h),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 56.h),
                            shape: const StadiumBorder(),
                            backgroundColor: const Color(0xffDD4B39),
                            foregroundColor: Colors.white),
                        onPressed: () {},
                        icon: Padding(
                          padding: EdgeInsetsDirectional.only(end: 21.w),
                          child: Text(
                            'G+',
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                        label: Text('Login with Google',
                            style: TextStyle(fontSize: 12.sp))),
                  ),
                  SizedBox(
                    height: 83.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don't have an Account?",
                        style: TextStyle(
                            color: const Color(0xff7C7D7E), fontSize: 14.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(
                              page: const SignUpScreen(), withHistory: false);
                        },
                        child: Text(
                          ' Sign Up',
                          style: TextStyle(
                              color: const Color(0xffFC6011),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
