import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wce_support/Exceptions/httpexception.dart';

class Auth with ChangeNotifier {
  String? token;
  String? user_id;

  String? ip = "192.168.43.89";
  Future<void> login(String username, String password) async {
    final url = Uri.parse("http://${ip}:5000/user/login");
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
      print(statusCode);
      if (statusCode != 200) {
        throw HttpException(extractedData['message']);
      }
      // print(extractedData);
      user_id = extractedData['userid'];
      token = extractedData['token'];
      // print({user_id, token});
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> createUser(dynamic userdetails) async {
    var url = Uri.parse("http://${ip}:5000/user/createuser");
    print(userdetails);
    try {
      var response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'firstname': userdetails['firstName'],
        'lastname': userdetails["lastName"],
        'username': userdetails["username"],
        'password': userdetails["password"],
        'email': userdetails["email"],
        'role': userdetails["role"],
        'department': userdetails["department"],
        'year': userdetails["year"],
        'mobile': userdetails["year"]
      });
      final extractedData = json.decode(response.body);
      print(extractedData);
      print(response.statusCode);
      if (response.statusCode != 200) {
        throw HttpException(extractedData["message"]);
      }
    } catch (error) {
      rethrow;
    }
  }
  // Future<void>createManagment(String )
}
