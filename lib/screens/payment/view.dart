import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/proj_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
        title: const Text('Payment Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 28.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 21.0.w),
            child: Text(
              'Customize your payment method',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff4A4B4D)),
            ),
          ),
          SizedBox(
            height: 16.5.h,
          ),
          Divider(
            endIndent: 21.w,
            indent: 21.w,
          ),
          SizedBox(
            height: 18.5.h,
          ),
          SizedBox(
            height: 193,
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 82.h,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 50, color: Colors.black.withOpacity(0.5))
                  ]),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 167.h,
                  color: const Color(0xffF7F7F7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
                        child: ListTile(
                          leading: Text(
                            'Cash/Card on delivery',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff4A4B4D)),
                          ),
                          trailing: Icon(
                            Icons.done,
                            size: 13.2.w,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Divider(
                        indent: 40.w,
                        endIndent: 40.w,
                        color: const Color(0xff8A8A8A),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 45.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/visa.png',
                              width: 53.w,
                              height: 31.h,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 19.w,
                            ),
                            Text(
                              '**** ****      2187',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff4A4B4D)),
                            ),
                            SizedBox(
                              width: 28.w,
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: 1.w,
                                    color: Theme.of(context).primaryColor),
                                fixedSize: Size(95.w, 30.h),
                                shape: const StadiumBorder(),
                              ),
                              child: Text(
                                'Delete Card',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.visible),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 40.w,
                        endIndent: 40.w,
                        color: const Color(0xff8A8A8A),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(top: 5.h, start: 45.0.w),
                        child: Text(
                          'Other Methods',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff4A4B4D)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 40.h),
            child: ProjButton(
              title: 'Add Another Credit/Debit Card',
              onPress: () {},
            ),
          )
        ],
      ),
    );
  }
}
