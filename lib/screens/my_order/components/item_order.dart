import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemOrder extends StatelessWidget {
  final String leading, trailing;
  final Color? color, tileColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  const ItemOrder(
      {super.key,
      required this.leading,
      required this.trailing,
      this.color,
      this.fontWeight,
      this.tileColor,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColor ?? const Color(0xffF6F6F6),
      shape: UnderlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: const Color(0xff707070))),
      leading: Text(
        leading,
        style: TextStyle(
            fontSize: 13.sp,
            fontWeight: fontWeight,
            color: const Color(0xff4A4B4D)),
      ),
      trailing: Text(trailing,
          style: TextStyle(
              fontSize: fontSize ?? 13.sp,
              fontWeight: FontWeight.bold,
              color: color ?? const Color(0xff4A4B4D))),
    );
  }
}
