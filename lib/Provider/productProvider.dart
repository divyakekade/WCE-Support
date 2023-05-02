import 'dart:convert';

import 'package:flutter/material.dart';

import '../Exceptions/httpexception.dart';
import 'package:http/http.dart' as http;

class Prod with ChangeNotifier {
  static const ip = "192.168.43.89";
  static const url1="http://$ip:5000";
  static const url2="https://expensive-train-ray.cyclic.app/";
  var products = [];
  var favproducts = [];
  Future<void> addProduct(String name, String description, String quantity,
      String price,String image, String? id) async {
    final url = Uri.parse("$url2/product/add");
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
        'quantity': quantity,
        'price': price,
        'image':image
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
    final url = Uri.parse("$url2/product/send");
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
    final url = Uri.parse("$url2/product/delete/$gid");

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

  Future<void> updateProduct(String name, String description, String quantity,
      String price, String uid,String image, String pid) async {
    final url = Uri.parse("$url2/product/update");
    try {
      final response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': uid
      }, body: <String, String>{
        'name': name,
        'description': description,
        'quantity': quantity,
        'price': price,
        'image':image,
        'pid': pid
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

  Future<dynamic> addBookmark(String uid, String pid) async {
    final url = Uri.parse("$url2/user/addbookmark");
    try {
      final response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': uid
      }, body: <String, String>{
        'pid': pid
      });
      final extractedData = json.decode(response.body);
      print(extractedData);
      if (response.statusCode != 200) {
        throw HttpException(extractedData['message']);
      }
      return extractedData['newuser'];
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> removeBookmark(String uid, String pid) async {
    final url = Uri.parse("$url2/user/removebookmark");
    try {
      final response = await http.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': uid
      }, body: <String, String>{
        'pid': pid
      });
      final extractedData = json.decode(response.body);
      print(extractedData);
      if (response.statusCode != 200) {
        // print(HttpException(extractedData['message']));
        throw HttpException(extractedData['message']);
      }
      return extractedData['newuser'];
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> getfavouriteList(String uid) async {
    try {
      
      final url = Uri.parse("$url2/user/favourite");
      final response = await http.get(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'id': uid
      });
      final extractedData = json.decode(response.body);
      if (response.statusCode != 200) {
        // print(HttpException(extractedData['message']));
        throw HttpException(extractedData['message']);
      }

       favproducts = extractedData['favourite'];
      // for (int i = 0; i < favproductsid.length; i++) {
      //   final product =
      //       products.firstWhere((prod) => prod['_id'] == favproductsid[i]);
            
      //   favproducts.add(product);
      // }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
