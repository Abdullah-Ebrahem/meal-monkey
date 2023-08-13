import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/methods.dart';
import 'package:flutter_application_1/core/proj_button.dart';
import 'package:flutter_application_1/screens/login/view.dart';
import 'package:flutter_application_1/screens/signup/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AfterSplashScreen extends StatelessWidget {
  const AfterSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 410.h,
            child: Stack(children: [
              Image.asset(
                "assets/images/organe_shape.png",
                height: 375.h,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/monkey_face.png",
                  width: 103.11.w,
                  height: 105.1.h,
                ),
              )
            ]),
          ),
          SizedBox(
            height: 13.9.h,
          ),
          Text.rich(TextSpan(
              text: 'Meal',
              style: TextStyle(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffFC6011)),
              children: [
                TextSpan(
                  text: 'Monkey',
                  style: TextStyle(
                      fontSize: 34.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff4A4B4D)),
                )
              ])),
          SizedBox(
            height: 6.h,
          ),
          Text(
            'food delivery'.toUpperCase(),
            style: TextStyle(
              letterSpacing: 2.36.w,
              color: const Color(0xff4A4B4D),
              fontSize: 10.sp,
            ),
          ),
          SizedBox(
            height: 44.h,
          ),
          Text(
            'Discover the best foods from over 1,000\nrestaurants and fast delivery to your doorstep',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.sp, color: const Color(0xff7C7D7E)),
          ),
          SizedBox(
            height: 36.h,
          ),
          ProjButton(
            title: 'Login',
            onPress: () {
              navigateTo(page: const LoginScreen(), withHistory: false);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 21.w, end: 21.w),
            child: OutlinedButton(
              onPressed: () {
                navigateTo(page: const SignUpScreen(), withHistory: false);
              },
              style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  fixedSize: Size(MediaQuery.of(context).size.width, 56.h),
                  side: BorderSide(color: const Color(0xffFC6011), width: 1.w)),
              child: Text(
                'Create an Account',
                style: TextStyle(
                    color: const Color(0xffFC6011),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
