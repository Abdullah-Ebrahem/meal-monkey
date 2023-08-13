import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/inbox/components/item_inbox.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controller.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({super.key});
  final controller = InboxController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30.4.w,
        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: 6.w),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
            ),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
        title: const Text('InBox'),
      ),
      body: ListView.builder(
        padding: EdgeInsetsDirectional.only(top: 47.h, start: 22, end: 22),
        itemCount: controller.titles.length,
        itemBuilder: (context, index) => ItemInbox(
          date: controller.date[index],
          title: controller.titles[index],
          subTitle: controller.subTitles[index],
        ),
      ),
    );
  }
}
