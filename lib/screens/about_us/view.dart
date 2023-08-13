import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
        title: const Text('About Us'),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(start: 34.w, top: 55.h, end: 22.w),
        children: [
          Wrap(
            children: [
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in'
                ' reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla'
                ' pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa'
                ' qui officia deserunt mollit anim id est laborum.\n\n'
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in'
                ' reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla'
                ' pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa'
                ' qui officia deserunt mollit anim id est laborum.\n\n'
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in'
                ' reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla'
                ' pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa'
                ' qui officia deserunt mollit anim id est laborum.',
                style:
                    TextStyle(color: const Color(0xff4A4B4D), fontSize: 14.sp),
              )
            ],
          ),
        ],
      ),
    );
  }
}
