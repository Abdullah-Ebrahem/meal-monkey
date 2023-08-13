import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static saveNotFirstTime() async {
    await prefs.setBool('firstTime', false);
  }

  static bool getIfFirstTime() => prefs.getBool('firstTime') ?? true;

  static savetoken({required String token}) async {
    await prefs.setString('token', token);
  }

  static String getToken() => prefs.getString('token') ?? '';

  static saveCount(int count) async {
    await prefs.setInt('count', count);
  }

  static int getCount() => prefs.getInt('count') ?? 0;

  static saveName(name) async {
    await prefs.setString('name', name);
  }

  static String getName() => prefs.getString('name') ?? 'Emilia Clarke';

  static saveEmail(email) async {
    await prefs.setString('email', email);
  }

  static String getEmail() =>
      prefs.getString('email') ?? 'emiliaclarke@email.com';

  static saveMobile(mobile) async {
    await prefs.setString('mobile', mobile);
  }

  static String getMobile() => prefs.getString('mobile') ?? '01111111111';

  static saveAddress(address) async {
    await prefs.setString('address', address);
  }

  static String getAddress() =>
      prefs.getString('address') ?? 'No 23, 6th Lane, Colombo 03';

  static savePassword(password) async {
    await prefs.setString('password', password);
  }

  static String getPassword() => prefs.getString('password') ?? '*************';

  static saveConfirmPassword(confirmPassword) async {
    await prefs.setString('confirmPassword', confirmPassword);
  }

  static String getConfirmPassword() =>
      prefs.getString('confirmPassword') ?? '*************';

  static saveProfileImg(imgUrl) async {
    await prefs.setString('imgUrl', imgUrl);
  }

  static String getProfileImg() => prefs.getString('imgUrl') ?? '';
}
