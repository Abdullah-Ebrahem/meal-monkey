import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/rating_bar.dart';
import 'package:flutter_application_1/screens/home/controller.dart';
import 'package:flutter_application_1/screens/home/model.dart';
import 'package:flutter_application_1/screens/home/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ItemRestaurent extends StatelessWidget {
  final RestaurentModel model;
  bool isLast = false;
  ItemRestaurent({super.key, required this.model, required this.isLast});
  double rate = 0;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = HomeCubit.getObject(context);
      return Container(
        margin: EdgeInsetsDirectional.only(bottom: isLast ? 0 : 26.8.h),
        height: 242.9.h,
        child: Column(
          children: [
            Image.asset(
              model.imgUrl!,
              height: 193.h,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 7.h,
            ),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 21.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      model.title!,
                      style: TextStyle(
                          color: const Color(0xff4A4B4D),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RateIcon(
                          onRate: (rating) {
                            rate = rating;
                            cubit.newRate();
                          },
                        ),
                        SizedBox(
                          width: 4.2.w,
                        ),
                        BlocBuilder<HomeCubit, HomeStates>(
                          builder: (context, state) => Text(
                            rate.toString(),
                            style: TextStyle(
                                color: const Color(0xffFC6011),
                                fontSize: 11.sp),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '(124 ratings) Café',
                          style: TextStyle(
                              fontSize: 12.sp, color: const Color(0xffB6B7B7)),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CircleAvatar(
                          radius: 2.r,
                          backgroundColor: const Color(0xffFC6011),
                        ),
                        Text(
                          'Western Food',
                          style: TextStyle(
                              fontSize: 12.sp, color: const Color(0xffB6B7B7)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
