import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemTitle extends StatelessWidget {
  final List<Widget> children;
  final String title;
  const ItemTitle({super.key, required this.children, required this.title});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const UnderlineInputBorder(borderSide: BorderSide.none),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff4A4B4D)),
      ),
      trailing: Text(
        'View all',
        style: TextStyle(color: const Color(0xffFC6011), fontSize: 13.sp),
      ),
      children: children,
    );
  }
}
