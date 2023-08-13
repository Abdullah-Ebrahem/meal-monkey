import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/proj_button.dart';
import 'package:flutter_application_1/screens/my_order/components/item_order.dart';
import 'package:flutter_application_1/screens/my_order/components/item_rate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
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
        title: const Text('My Order'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 21.w, top: 27.h, bottom: 37.h),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/my_order.png',
                  width: 80.h,
                  height: 80.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'King Burgers',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff4A4B4D)),
                    ),
                    const ItemRate(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Burger',
                          style: TextStyle(
                              fontSize: 12.sp, color: const Color(0xffB6B7B7)),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        CircleAvatar(
                          radius: 2.r,
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          'Western Food',
                          style: TextStyle(
                              fontSize: 12.sp, color: const Color(0xffB6B7B7)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          size: 13.39.h,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          'No 03, 4th Lane, Newyork',
                          style: TextStyle(
                              fontSize: 12.sp, color: const Color(0xffB6B7B7)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const ItemOrder(leading: 'Beef Burger x1', trailing: '16'),
          const ItemOrder(leading: 'Classic Burger x1', trailing: '14'),
          const ItemOrder(leading: 'Cheese Chicken Burger x1', trailing: '17'),
          const ItemOrder(leading: 'Chicken Legs Basket x1', trailing: '15'),
          const ItemOrder(leading: 'French Fries Large x1', trailing: '6'),
          ItemOrder(
            leading: 'Delivery Instrusctions',
            trailing: 'Add Notes',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            tileColor: Colors.transparent,
          ),
          ItemOrder(
            leading: 'Sub Total',
            trailing: '68',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            tileColor: Colors.transparent,
          ),
          ItemOrder(
            leading: 'Delivery Cost',
            trailing: '2',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            tileColor: Colors.transparent,
          ),
          ItemOrder(
            leading: 'Total',
            trailing: '70',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Theme.of(context).primaryColor,
            tileColor: Colors.transparent,
          ),
          SizedBox(
            height: 24.h,
          ),
          ProjButton(
            title: 'Checkout',
            onPress: () {},
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
