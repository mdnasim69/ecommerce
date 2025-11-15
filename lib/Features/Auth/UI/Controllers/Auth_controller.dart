import 'dart:convert';
import 'package:ecommerce/Features/Auth/data/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  String? acessToken;
  UserModel? user;

  final String _tokenKey = "token";
  final String _userKey = "user";

  Future<void> saveData(String token, UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_tokenKey, token);
    sharedPreferences.setString(_userKey, jsonEncode(userModel.toJson()));
    acessToken = token;
    user = userModel;
  }

  Future<void> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    acessToken = sharedPreferences.getString(_tokenKey);
    debugPrint(acessToken);
    String? userData = sharedPreferences.getString(_userKey);
    if (userData!=null) {
      user = UserModel.fromJson(jsonDecode(userData));
    }
  }

  Future<bool> IsLogIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token1 = sharedPreferences.getString(_tokenKey);
    // if (token1 == null) {
    //   return false;
    // } else {
    //   await getData();
    //   return true;
    // }
    if (token1!=null ) {
      await getData();
      return true;
    } else {
      return false;
    }

  }

  Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    acessToken = null;
    user = null;
  }

  bool ValidUser(){
    return acessToken!=null;
  }
}
