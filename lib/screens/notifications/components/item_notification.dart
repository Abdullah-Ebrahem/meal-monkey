import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemNotification extends StatelessWidget {
  final String title, subTitle;
  const ItemNotification(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: UnderlineInputBorder(
          borderSide: BorderSide(color: const Color(0xffEEEEEE), width: 1.w)),
      leading: CircleAvatar(
        radius: 5.r,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: const Color(0xff4A4B4D),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
            color: const Color(0xffB6B7B7),
            fontSize: 12.sp,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
