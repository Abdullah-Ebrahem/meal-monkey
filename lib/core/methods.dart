import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache_helper.dart';

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

void cacheData(
    {required String firstName,
    required String lastName,
    required String email,
    required String token}) {
  CacheHelper.saveName('$firstName  $lastName');
  CacheHelper.saveEmail(email);
  CacheHelper.savetoken(token: token);
}

void showMsg({required String msg}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!)
      .showSnackBar(SnackBar(content: Text(msg)));
}
