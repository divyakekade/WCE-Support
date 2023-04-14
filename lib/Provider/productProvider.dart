import 'dart:convert';

import 'package:flutter/material.dart';

import '../Exceptions/httpexception.dart';
import 'package:http/http.dart' as http;

class Prod with ChangeNotifier {
  static const ip = "10.40.7.176";
  var products = [];
  Future<void> addProduct(String name, String description, int quantity,
      double price, String? id) async {
    final url = Uri.parse("http://${ip}:5000/product/add");
    try {
      if (id == null) {
        throw HttpException("You are not authenticated");
      }
      var response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': id
      }, body: <String, String>{
        'name': name,
        'description': description,
        'quantity': quantity.toString(),
        'price': price.toString()
      });
      final extractedData = json.decode(response.body);
      print(extractedData);
      if (response.statusCode != 200) {
        throw HttpException(extractedData['message']);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> getProducts() async {
    final url = Uri.parse("http://${ip}:5000/product/send");
    print("hello");

    try {
      // if (id == null) {
      //   throw HttpException("You are not authenticated");
      // }
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      products = extractedData['products'];
      ChangeNotifier();

      // print(products);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

Future<void> deleteProduct(String uid, String? gid) async {
    final url = Uri.parse("http://${ip}:5000/product/delete/$gid");

    try {
      final response = await http.get(url, headers: <String, String>{
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

Future<void> updateProduct(
      String name, String description, String quantity, String price,String uid,String pid)async {
    final url = Uri.parse("http://${ip}:5000/product/update");
    try {
      final response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': uid
      }, body: <String, String>{
        'name': name,
        'description': description,
        'quantity': quantity,
        'price': price,
        'pid':pid
      });
      final extractedData = json.decode(response.body);
      print(extractedData);
      if (response.statusCode != 200) {
        throw HttpException(extractedData['message']);
      }
      // var p = extractedData['user'];
      // ChangeNotifier();
    } catch (error) {
      rethrow;
    }
  }

}
