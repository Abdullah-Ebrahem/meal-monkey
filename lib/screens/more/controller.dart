import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/about_us/view.dart';
import 'package:flutter_application_1/screens/inbox/view.dart';
import 'package:flutter_application_1/screens/more/model.dart';
import 'package:flutter_application_1/screens/notifications/view.dart';
import 'package:flutter_application_1/screens/payment/view.dart';

import '../my_order/view.dart';

class MoreController {
  List<MoreModel> models = [
    MoreModel(title: 'Payment Details', icon: Icons.monetization_on),
    MoreModel(title: 'My Orders', icon: Icons.shopping_bag_sharp),
    MoreModel(title: 'Notifications', icon: Icons.notifications),
    MoreModel(title: 'Inbox', icon: Icons.forward_to_inbox_sharp),
    MoreModel(title: 'About Us', icon: Icons.adobe_outlined)
  ];
  var actions = [
    const PaymentScreen(),
    const MyOrderScreen(),
    NotificationScreen(),
    InboxScreen(),
    const AboutUsScreen(),
  ];
}
