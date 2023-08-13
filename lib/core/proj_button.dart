import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjButton extends StatefulWidget {
  final String title;
  final Function() onPress;
  const ProjButton({super.key, required this.title, required this.onPress});

  @override
  State<ProjButton> createState() => _ProjButtonState();
}

class _ProjButtonState extends State<ProjButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 21.w, end: 21.w),
      child: ElevatedButton(
        onPressed: widget.onPress,
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            fixedSize: Size(MediaQuery.of(context).size.width, 56.h),
            backgroundColor: const Color(0xffFC6011)),
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
      ),
    );
  }
}
