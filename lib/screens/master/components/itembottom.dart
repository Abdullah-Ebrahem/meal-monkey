import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemBottom extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() ontap;
  final bool isSelected;
  const ItemBottom(
      {super.key,
      required this.icon,
      required this.title,
      required this.ontap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color:
                isSelected ? const Color(0xffFC6011) : const Color(0xffB6B7B7),
            size: 28,
          ),
          Text(
            title,
            style: TextStyle(
                color: isSelected
                    ? const Color(0xffFC6011)
                    : const Color(0xffB6B7B7),
                fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
