import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  const SearchBarCustom({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      margin: EdgeInsetsDirectional.only(start: 21.w, end: 21.w, bottom: 2.h),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsetsDirectional.only(top: 12, bottom: 14),
            prefixIcon: Icon(
              size: 18.5.h,
              Icons.search,
              color: const Color(0xff7C7D7E),
            ),
            hintText: 'Search food',
            hintStyle:
                TextStyle(color: const Color(0xffB6B7B7), fontSize: 14.sp),
            filled: true,
            fillColor: const Color(0xffF2F2F2),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(28))),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60);
}
