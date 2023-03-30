import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Griv with ChangeNotifier {
  static const ip = "192.168.43.8";

  Future<void> putGrievance(String subject, String description,
      String selectedOption, String id) async {
    final url = Uri.parse("http://192.168.43.89:5000/grievances/putgrievances");
    try {
      var response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': id
      }, body: <String, String>{
        'subject': subject,
        'description': description,
        'section': selectedOption
      });
      final extractedData = json.decode(response.body);
      print(extractedData);
    } catch (error) {
      rethrow;
    }
  }
}
