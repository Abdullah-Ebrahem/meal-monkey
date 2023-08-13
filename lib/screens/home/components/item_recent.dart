import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/methods.dart';
import 'package:flutter_application_1/screens/home/controller.dart';
import 'package:flutter_application_1/screens/home/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ItemRecent extends StatelessWidget {
  double rate = 0;
  final String title, subTitle, imgUrl;
  ItemRecent(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = HomeCubit.getObject(context);
      return Container(
        margin: EdgeInsetsDirectional.only(start: 21.w, bottom: 15.h),
        width: 292.w,
        height: 80.h,
        child: Row(
          children: [
            Image.asset(
              imgUrl,
              width: 75.w,
              height: 75.w,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 22.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff4A4B4D)),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Café',
                      style: TextStyle(
                          fontSize: 11.sp, color: const Color(0xffB6B7B7)),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    CircleAvatar(
                      radius: 2.r,
                      backgroundColor: const Color(0xffFC6011),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                          fontSize: 11.sp, color: const Color(0xffB6B7B7)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: navigatorKey.currentContext!,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  child: const Text('done'))
                            ],
                            title: const Text('Rating'),
                            content: RatingBar.builder(
                              initialRating: 1,
                              minRating: 1,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 3.0.w),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                rate = rating;
                                cubit.newRate();
                              },
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.star,
                        color: const Color(0xffFC6011),
                        size: 14.19.h,
                      ),
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
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      '(124 Ratings)',
                      style: TextStyle(
                          fontSize: 11.sp, color: const Color(0xffB6B7B7)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
