import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemInbox extends StatefulWidget {
  final String title, subTitle, date;
  const ItemInbox(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.date});

  @override
  State<ItemInbox> createState() => _ItemInboxState();
}

class _ItemInboxState extends State<ItemInbox> {
  bool isLiked = false;
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
        widget.title,
        style: TextStyle(
            color: const Color(0xff4A4B4D),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        widget.subTitle,
        style: TextStyle(
            color: const Color(0xffB6B7B7),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.date,
            style: TextStyle(fontSize: 9.sp, color: const Color(0xff7C7D7E)),
          ),
          GestureDetector(
            onTap: () {
              isLiked = !isLiked;
              setState(() {});
            },
            child: isLiked
                ? Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 13.w,
                  )
                : Icon(
                    Icons.star_border_purple500_outlined,
                    color: Colors.amber,
                    size: 13.w,
                  ),
          )
        ],
      ),
    );
  }
}
