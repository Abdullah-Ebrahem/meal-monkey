import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/methods.dart';
import '../cubit.dart';

class ItemRate extends StatefulWidget {
  const ItemRate({super.key});

  @override
  State<ItemRate> createState() => _ItemRateState();
}

class _ItemRateState extends State<ItemRate> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrderCubit(),
      child: Builder(builder: (context) {
        final cubit = MyOrderCubit.getObject(context);
        double rate = 0;
        return Padding(
          padding: EdgeInsetsDirectional.only(top: 5.h, bottom: 5.8.h),
          child: Row(
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
                                    borderRadius: BorderRadius.circular(15))),
                            child: const Text('done'))
                      ],
                      title: const Text('Rating'),
                      content: RatingBar.builder(
                        initialRating: 1,
                        minRating: 1,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0.w),
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
              BlocBuilder<MyOrderCubit, MyOrderStates>(
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
                style:
                    TextStyle(fontSize: 11.sp, color: const Color(0xffB6B7B7)),
              )
            ],
          ),
        );
      }),
    );
  }
}
