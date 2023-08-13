import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache_helper.dart';
import 'package:flutter_application_1/core/methods.dart';
import 'package:flutter_application_1/core/proj_button.dart';
import 'package:flutter_application_1/screens/after_splash/view.dart';
import 'package:flutter_application_1/screens/onboarding/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = OnBoardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 112.h,
            width: MediaQuery.of(context).size.width,
          ),
          Image.asset(
            controller.models[controller.currentPage].imgUrl,
            height: controller.models[controller.currentPage].imgHeight.h,
            width: controller.models[controller.currentPage].imgWeidth.w,
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                controller.models.length,
                (index) => Padding(
                      padding:
                          EdgeInsetsDirectional.only(end: index == 2 ? 0 : 5),
                      child: CircleAvatar(
                        radius: 4.r,
                        backgroundColor: controller.currentPage == index
                            ? const Color(0xffFC6011)
                            : const Color(0xffD6D6D6),
                      ),
                    )),
          ),
          SizedBox(
            height: 32.h,
          ),
          Text(
            controller.models[controller.currentPage].title,
            style: TextStyle(
                fontSize: 28.sp,
                color: const Color(0xff4A4B4D),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 33.h,
          ),
          Text(
            controller.models[controller.currentPage].subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(color: const Color(0xff7C7D7E), fontSize: 13.sp),
          ),
          SizedBox(
            height: 40.h,
          ),
          ProjButton(
            title: controller.currentPage == 2 ? 'Finish' : 'Next',
            onPress: () {
              setState(() {
                if (controller.currentPage == 2) {
                  CacheHelper.saveNotFirstTime();
                  navigateTo(
                      page: const AfterSplashScreen(), withHistory: false);
                } else {
                  controller.currentPage++;
                }
              });
            },
          )
        ],
      ),
    );
  }
}
