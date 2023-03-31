import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wce_support/Exceptions/httpexception.dart';

class Griv with ChangeNotifier {
  static const ip = "192.168.43.89";
  var grievance = [];
  Future<void> putGrievance(String subject, String description,
      String selectedOption, String? id) async {
    final url = Uri.parse("http://${ip}:5000/grievances/putgrievances");
    try {
      if (id == null) {
        throw HttpException("You are not authenticated");
      }
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

  Future<void> viewGrievances() async {
    final url = Uri.parse("http://${ip}:5000/grievances/viewgrievances");
    print("hello");

    try {
      // if (id == null) {
      //   throw HttpException("You are not authenticated");
      // }
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      grievance = extractedData['grievances'];
      ChangeNotifier();
      
      print(grievance);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  List sendGrievanceList() {
    return [...grievance];
  }
}