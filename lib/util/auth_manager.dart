import 'package:digicala_test1/di/di.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final SharedPreferences _sharedPerf = locator.get();
  static final ValueNotifier<String?> authChangeNotifire = ValueNotifier(null);
  //Save
  static void saveToken(String token) async {
    _sharedPerf.setString('access_tokrn', token);
    authChangeNotifire.value = token;
  }

  //Read
  static String readAuth() {
    return _sharedPerf.getString('access_tokrn') ?? '';
  }

  //Logout
  static void loguot() {
    _sharedPerf.clear();
    authChangeNotifire.value = null;
  }

  //is Login or Logout??
  static bool isLogin() {
    String token = readAuth();
    return token.isEmpty;
  }
}
