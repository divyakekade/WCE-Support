import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wce_support/Exceptions/httpexception.dart';

class Griv with ChangeNotifier {
  static const ip = "192.168.43.89";
  static const url1 = "http://$ip:5000";
  // static const url2 = "https://expensive-train-ray.cyclic.app/";
  List<dynamic> grievance = [];
  Future<void> putGrievance(String subject, String description,
      String selectedOption, String image, String? id) async {
    final url = Uri.parse("$url1/grievances/putgrievances");
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
        'section': selectedOption,
        'image': image
      });
      final extractedData = json.decode(response.body);
      // print(extractedData);
      if (response.statusCode != 200) {
        // print(HttpException(extractedData['message']));
        throw HttpException(extractedData['message']);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> viewGrievances() async {
    final url = Uri.parse("$url1/grievances/viewgrievances");
    print("hello");

    try {
      // if (id == null) {
      //   throw HttpException("You are not authenticated");
      // }
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      grievance = extractedData['grievances'];
      ChangeNotifier();
      if (response.statusCode != 200) {
        // print(HttpException(extractedData['message']));
        throw HttpException(extractedData['message']);
      }
      // print(grievance);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  List sendGrievanceList() {
    return [...grievance];
  }

  Future<void> deleteGrievance(String uid, String gid) async {
    final url = Uri.parse("$url1/grievances/delete/$gid");

    try {
      final response = await http.delete(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': uid
      });
      final extractedData = json.decode(response.body);
      if (response.statusCode != 200) {
        throw HttpException(extractedData["message"]);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> changeStatus(String? id, String gid, String status) async {
    final url = Uri.parse("$url1/grievances/changestatus");
    try {
      if (id == null) {
        throw HttpException("You are not authenticated");
      }
      final response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': id
      }, body: <String, String>{
        'status': status,
        'gid': gid
      });

      final extractedData = json.decode(response.body);
      if (response.statusCode != 200) {
        throw HttpException(extractedData["message"]);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> putfeedback(
      String? id, String gid, String review, String comment) async {
    final url = Uri.parse("$url1/grievances/putfeedback");
    var currengriv = grievance.firstWhere((griv) => griv["_id"] == gid);
    print(currengriv);
    try {
      if (id == null) {
        throw HttpException("You are not authenticated");
      }
      final response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': id
      }, body: <String, String>{
        'gid': gid,
        'review': review,
        'comment': comment,
      });
      final extractedData = json.decode(response.body);
      if (response.statusCode != 200) {
        throw HttpException(extractedData['message']);
      }
      // print(extractedData['grievance']);
      var newgrievance = extractedData['grievance'];
      List<dynamic> newgrievanceList =
          grievance.where((griv) => griv['_id'] != gid).toList();
      print(newgrievanceList);
      newgrievanceList.add(newgrievance);
      grievance = newgrievanceList;

      // grievance.add(newgrievance);
      notifyListeners();
      // print(currengriv);
      // print(newgrievance);
    } catch (error) {
      rethrow;
    }
  }
}
