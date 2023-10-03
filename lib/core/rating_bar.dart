import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'methods.dart';

class RateIcon extends StatelessWidget {
  final Function(double) onRate;
  const RateIcon({super.key, required this.onRate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
                  onRatingUpdate: onRate,
                ),
              ),
            );
          },
          child: Icon(
            Icons.star,
            color: const Color(0xffFC6011),
            size: 14.5.h,
          ),
        ),
      ],
    );
  }
}
