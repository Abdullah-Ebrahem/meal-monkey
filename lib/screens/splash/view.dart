import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache_helper.dart';
import 'package:flutter_application_1/core/methods.dart';
import 'package:flutter_application_1/screens/after_splash/view.dart';
import 'package:flutter_application_1/screens/master/view.dart';
import 'package:flutter_application_1/screens/onboarding/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        navigateTo(
            page: CacheHelper.getIfFirstTime()
                ? const OnBoardingScreen()
                : CacheHelper.getToken().isEmpty
                    ? const AfterSplashScreen()
                    : const MasterScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash_screen.png"),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/monkey_face.png",
              width: 103.11.w,
              height: 105.1.h,
            ),
            SizedBox(height: 13.9.h),
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
            )
          ],
        ),
      ),
    );
  }
}
