import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? token;
  String? user_id;

  Future<void> signUp(String email, String prn, String password) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCipx5QCsrJKccemptp_3xUiYImffeSOEQ");

    try {
      final responce = await http.post(url,
          body: json.encode({
            "email": email,
            "password": password,
            "returnSecureToken": true,
          }));

      final extractData = json.decode(responce.body);
      print(extractData['localId']);
      // var user = {"email": email, "prn": prn, "id": extractData['localId']};
      final url2 = Uri.parse(
          "https://wce-support-default-rtdb.firebaseio.com/user/1.json");
      final res = await http.post(url2,
          body: json.encode(
              {"email": email, "prn": prn, "id": extractData['localId']}));
      final extract = json.decode(res.body);
      print(extract);
    } catch (error) {
      print(error);
    }
  }
}
