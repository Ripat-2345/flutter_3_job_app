// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/models/job_model.dart';
import 'package:http/http.dart' as http;

class JobProvider with ChangeNotifier {
  Future<List<JobModel>?> getJobs() async {
    try {
      var response = await http.get(
        Uri.parse("https://future-jobs-api.vercel.app/jobs"),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);

        for (var job in parsedJson) {
          jobs.add(JobModel.fromJson(job));
        }
        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<JobModel>?> getJobByCategory(String category) async {
    try {
      var response = await http.get(
        Uri.parse("https://future-jobs-api.vercel.app/jobs?category=$category"),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);

        for (var job in parsedJson) {
          jobs.add(JobModel.fromJson(job));
        }
        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
