// ignore_for_file: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('there is an error${response.statusCode}');
    }
  }

  Future<dynamic> post({required String url, @required dynamic body}) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    if (response.statusCode == 200) {
      return jsonEncode(response.body);
    } else {
      throw Exception('error${response.statusCode} with body ${response.body}');
    }
  }

  Future<dynamic> put({required String url, @required dynamic body}) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    if (response.statusCode == 200) {
      return jsonEncode(response.body);
    } else {
      throw Exception('error${response.statusCode} with body ${response.body}');
    }
  }
}
