import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/notifications/components/item_notification.dart';
import 'package:flutter_application_1/screens/notifications/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final controller = NotificationController();
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
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        padding: EdgeInsetsDirectional.only(top: 48.h),
        itemCount: controller.titles.length,
        itemBuilder: (context, index) => ItemNotification(
          title: controller.titles[index],
          subTitle: controller.subTitles[index],
        ),
      ),
    );
  }
}
