import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void navigateTo({required var page, bool withHistory = true}) {
  Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            ScaleTransition(
          scale: animation,
          child: child,
        ),
        pageBuilder: (context, animation, secondaryAnimation) => page,
      ),
      (route) => withHistory);
}
