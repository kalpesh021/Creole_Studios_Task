// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/constants/text_file.dart';

class APIServices {
  static getApiData(BuildContext context, int pageNumber) async {
    try {
      final res = await http.get(Uri.parse("${AppTexts.api}?page=$pageNumber"));
      
      if (res.statusCode == 200) {
        final data = await json.decode(res.body);
        return data;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(AppTexts.apiError)));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
