import 'package:shared_preferences/shared_preferences.dart';

class AppData {

  static Future saveRefreshToken(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('refresh_token', data);
  }

  static Future<String> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('refresh_token') ?? '';
    return data;
  }


  static Future saveAccessToken(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('access_token', data);
  }

  static Future<String> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('access_token') ?? '';
    return data;
  }


  static Future saveName(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('name', data);
  }

  static Future getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('name') ?? '';
    return data;
  }


  static Future saveCurrency(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('currency', data);
  }

  static Future getCurrency() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('currency') ?? 'تومان';
    return data;
  }




  static Future saveIsFirst(bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool('is_first', data);
  }

  static Future getIsFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_first') ?? true;
  }

  static Future saveBasketBuyerId(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('basket', data);
  }

  static Future getBasketBuyerId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('basket') ?? '';
  }



  // static String appName = 'Webinar';
  static bool canShowFinalizeSheet = true;
}
