import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemBar extends StatelessWidget implements PreferredSizeWidget {
  const ItemBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Find discounts, Offers special\nmeals and more!',
            style: TextStyle(fontSize: 14.sp, color: const Color(0xff7C7D7E)),
          ),
          SizedBox(
            height: 22.h,
            width: MediaQuery.of(context).size.width,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFC6011),
                  shape: const StadiumBorder(),
                  fixedSize: Size(157.w, 29.h)),
              child: Text(
                'Check Offers',
                style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(124.h);
}
