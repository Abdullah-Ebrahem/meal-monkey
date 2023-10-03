import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/rating_bar.dart';
import 'package:flutter_application_1/screens/home/controller.dart';
import 'package:flutter_application_1/screens/home/model.dart';
import 'package:flutter_application_1/screens/home/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ItemMostPopular extends StatelessWidget {
  RestaurentModel model = RestaurentModel();
  ItemMostPopular({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = HomeCubit.getObject(context);
      double rate = 0;
      return Container(
        margin: EdgeInsetsDirectional.only(start: 21.w, end: 19.w),
        width: 228.w,
        height: 186.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              model.imgUrl!,
              height: 135.h,
              width: 228.w,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              model.title!,
              style: TextStyle(
                  color: const Color(0xff4A4B4D),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Text(
                  'Café',
                  style: TextStyle(
                      color: const Color(0xffB6B7B7), fontSize: 12.sp),
                ),
                SizedBox(
                  width: 8.w,
                ),
                CircleAvatar(
                  radius: 2.r,
                  backgroundColor: const Color(0xffFC6011),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'Western Food',
                  style: TextStyle(
                      color: const Color(0xffB6B7B7), fontSize: 12.sp),
                ),
                SizedBox(
                  width: 26.9.w,
                ),
                RateIcon(
                  onRate: (rating) {
                    rate = rating;
                    cubit.newRate();
                  },
                ),
                SizedBox(
                  width: 6.2.w,
                ),
                BlocBuilder<HomeCubit, HomeStates>(
                  builder: (context, state) => Text(
                    rate.toString(),
                    style: TextStyle(
                        color: const Color(0xffFC6011), fontSize: 11.sp),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
