import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{


  static String userIdKey = "UserKey";
  static String userNameKey = "UserNameKey";
  static String userEmailKey = "UserEmailKey";

  Future<bool> saveUserId(String getUserId) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
   return sp.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserName(String getUserId) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(userNameKey, getUserId);
  }

  Future<bool> saveUserEmail(String getUserId) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(userEmailKey, getUserId);
  }


  Future<String?> getUserId() async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(userIdKey);

  }

  Future<String?> getUserName() async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(userNameKey);

  }

  Future<String?> getUserEmail() async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(userEmailKey);

  }









}