// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  Future<List<CategoryModel>?> getCategories() async {
    try {
      var response = await http.get(
        Uri.parse("https://future-jobs-api.vercel.app/categories"),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<CategoryModel> categories = [];
        List parsedJson = jsonDecode(response.body);

        for (var category in parsedJson) {
          categories.add(CategoryModel.fromJson(category));
        }

        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
