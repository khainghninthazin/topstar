import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_star/models/login_model.dart';

import '../core/constants/app_share_data.dart';

class PrefService {
  final SharedPreferences sharedPreferences;
  PrefService({required this.sharedPreferences});

  Future<void> saveAppToken({required String token}) async {
    sharedPreferences.setString(AppShareData.appToken, token);
  }

  Future<void> savePermission({required List<String>? permissions}) async {
    sharedPreferences.setStringList(AppShareData.accPermission, permissions!);
  }

  Future<String> getAppToken() async {
    return sharedPreferences.getString(AppShareData.appToken) ?? "";
  }

  Future<void> saveAppUser({required UserData user}) async {
    String data = jsonEncode(user);
    sharedPreferences.setString(AppShareData.appUser, data);
  }

  Future<dynamic> getUserData() async {
    dynamic data = sharedPreferences.getString(AppShareData.appUser) ?? "";
    return data;
  }

  Future<String> getAppUser() async {
    return sharedPreferences.getString(AppShareData.appUser) ?? "";
  }

  Future<void> saveAppLanguage({required bool val}) async {
    sharedPreferences.setBool(AppShareData.appLanguage, val);
  }

  Future<bool> getAppLanguage() async {
    return sharedPreferences.getBool(AppShareData.appLanguage) ?? false;
  }

  Future<String> getFcmToken() async {
    return sharedPreferences.getString(AppShareData.fcmToken) ?? "";
  }

  Future<List> getAccPermission() async {
    return sharedPreferences.getStringList(AppShareData.accPermission) ?? [];
  }
}
