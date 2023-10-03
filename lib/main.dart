import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/cache_helper.dart';
import 'package:flutter_application_1/screens/splash/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: const SplashScreen(),
      builder: (context, child) => MaterialApp(
          navigatorKey: navigatorKey,
          theme: ThemeData(
              primaryColor: const Color(0xffFC6011),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  iconTheme: const IconThemeData(color: Color(0xff4A4B4D)),
                  actionsIconTheme:
                      IconThemeData(color: const Color(0xff4A4B4D), size: 22.w),
                  color: Colors.white,
                  titleTextStyle: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff4A4B4D)))),
          title: 'Meal Monkey',
          debugShowCheckedModeBanner: false,
          home: child),
    );
  }
}
