import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wce_support/Exceptions/httpexception.dart';

class Auth with ChangeNotifier {
  String? token;
  String? user_id;
  dynamic user;
  static const  ip = "192.168.43.89";
  static const url1 = "http://$ip:5000";
  // static const url2 = "https://expensive-train-ray.cyclic.app/";
  void setuser(String? token, String? user, String? user_id) {
    if (user == null || token == null) {
      return;
    }
    print("hello");
    this.token = token;
    this.user = json.decode(user)['details'];
    // print();
    this.user_id = user_id;
  }

  Future<void> setUser(dynamic user) async {
    this.user = user;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final userv = json.encode({
      "details": user,
    });
    pref.setString("user", userv);
  }

  Future<void> login(String username, String password) async {
    final url = Uri.parse("$url1/user/login");
    print("Hello");
    try {
      var response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'username': username,
        'password': password,
      });
      final extractedData = json.decode(response.body);
      final statusCode = response.statusCode;
      // print(statusCode);
      if (statusCode != 200) {
        throw HttpException(extractedData['message']);
      }
      print(extractedData);
      user = extractedData['user'];
      user_id = extractedData['userid'];
      token = extractedData['token'];
      // print({user_id, token});
      notifyListeners();
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("token", extractedData['token']);
      pref.setString("userid", extractedData['userid']);
      final userv = json.encode({
        "details": extractedData['user'],
      });
      pref.setString("user", userv);
      print(pref.getString('token'));
    } catch (error) {
      rethrow;
    }
  }

  Future<void> createUser(dynamic userdetails) async {
    var url = Uri.parse("$url1/user/createuser");
    // print(userdetails);
    try {
      var response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'firstname': userdetails['firstName'],
        'lastname': userdetails["lastName"],
        'username': userdetails["username"],
        'password': userdetails["password"],
        'email': userdetails["email"],
        'department': userdetails["department"],
        'year': userdetails["year"],
        'mobile': userdetails["mobileNo"]
      });
      final extractedData = json.decode(response.body);
      // print(extractedData);
      // print(response.statusCode);
      if (response.statusCode != 200) {
        throw HttpException(extractedData["message"]);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<List> storeAllUsers(List<dynamic> users, String uid) async {
    var url = Uri.parse("$url1/user/storeusers");
    print(users);
    try {
      var response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': uid
      }, body: <String, String>{
        "users": json.encode(users)
      });
      final extractedData = json.decode(response.body);
      final statusCode = response.statusCode;
      // print(statusCode);
      if (statusCode == 300) {
        return extractedData['reentry'];
      }
      if (statusCode != 200) {
        throw HttpException(extractedData['message']);
      }
      return [];
      // print(extractedData);
    } catch (error) {
      rethrow;
    }
  }

  // Future<void>createManagment(String )
  Future<void> changePassword(String oldpassword, String newpassword) async {
    final url = Uri.parse("$url1/user/changepassword");
    try {
      final response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': user['_id']
      }, body: <String, String>{
        "oldpassword": oldpassword,
        "newpassword": newpassword
      });
      final extractedData = json.decode(response.body);
      if (response.statusCode != 200) {
        throw HttpException(extractedData['message']);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateProfile(
      String mobile, String department, String year) async {
    final url = Uri.parse("$url1/user/updateprofile");
    try {
      final response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': user['_id']
      }, body: <String, String>{
        "mobile": mobile,
        "department": department,
        "year": year
      });
      final extractedData = json.decode(response.body);
      print(extractedData);
      if (response.statusCode != 200) {
        throw HttpException(extractedData['message']);
      }
      user = extractedData['user'];
      ChangeNotifier();
    } catch (error) {
      rethrow;
    }
  }
  Future<void>deleteUser(String uid ,String duid)async{
    var url = Uri.parse("$url1/user/deleteuser/$duid");
    try {
      final response = await http.get(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': uid
      });
      final extractedData = json.decode(response.body);
      // print(extractedData);
      if (response.statusCode != 200) {
        throw HttpException(extractedData['message']);
      }
      // user = extractedData['user'];
      // ChangeNotifier();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    user = null;
    user_id = null;
    token = null;
    notifyListeners();
  }

  Future<dynamic> getuser(String uid) async {
    final url = Uri.parse("$url1/user/getuser/${uid}");
    try {
      final response = await http.get(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
      });
      final extractedData = json.decode(response.body);
      if (response.statusCode != 200) {
        // print(HttpException(extractedData['message']));
        throw HttpException(extractedData['message']);
      }
      return extractedData['user'];
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> fetchUserByPrn(String username, String uid) async {
    final url = Uri.parse("$url1/user/getuserbyprn/${username}");
    try {
      final response = await http.get(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': uid
      });
      final extractedData = json.decode(response.body);
      print(extractedData);
      if (response.statusCode != 200) {
        // print(extractedData['message']);
        throw HttpException(extractedData['message']);
        // return null ;
      }
      // print(extractedData['user']);
      return extractedData['user'];
    } catch (error) {
      rethrow;
    }
  }
}
