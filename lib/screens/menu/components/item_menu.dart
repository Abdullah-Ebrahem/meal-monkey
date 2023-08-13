import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/menu/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemMenu extends StatefulWidget {
  final MenuModel model;
  final Function() onTap;
  const ItemMenu({super.key, required this.model, required this.onTap});

  @override
  State<ItemMenu> createState() => _ItemMenuState();
}

class _ItemMenuState extends State<ItemMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 24, start: 15),
      width: MediaQuery.of(context).size.width,
      height: 87,
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 30, end: 28),
              width: MediaQuery.of(context).size.width,
              height: 87,
              child: const Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(30),
                        bottomStart: Radius.circular(30),
                        bottomEnd: Radius.circular(10),
                        topEnd: Radius.circular(10))),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: ListTile(
              onTap: widget.onTap,
              contentPadding: const EdgeInsetsDirectional.only(start: 0),
              leading: Image.asset(
                widget.model.imgUrl,
                width: 75.w,
                height: 75.h,
                fit: BoxFit.cover,
              ),
              title: Text(widget.model.tite),
              subtitle: Text(widget.model.subtitle),
              trailing: Card(
                margin: EdgeInsetsDirectional.only(end: 15.w),
                shape: const CircleBorder(),
                elevation: 10,
                child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(0xffFC6011),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
