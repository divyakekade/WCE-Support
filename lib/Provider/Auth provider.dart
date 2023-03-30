import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wce_support/Exceptions/httpexception.dart';

class Auth with ChangeNotifier {
  String? token;
  String? user_id;

  Future<void> login(String username, String password) async {
    final url = Uri.parse("http://10.40.7.176:5000/user/login");
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
}
