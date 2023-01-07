import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../models/popular_data_model.dart';
import 'package:http/http.dart' as http;

import '../utils/app_constants/app_constants.dart';
import '../utils/end_points/end_points.dart';

class SearchDataProvider extends ChangeNotifier{

List<PopularDataModel> searchDataModel = [];

bool searchDataLoading = false;

searchMovie({required String q}) async {
  searchDataLoading = true;
  notifyListeners();
  try {
    http.Response response = await http.get(
      Uri.parse(
          '${EndPoints.baseUrl}${EndPoints.search}$q&api_key=${AppConstants.apiKey}'),
    );
    if (response.statusCode == 200) {
      searchDataModel = [];
      json.decode(response.body)['results'].forEach((item) {
        searchDataModel.add(
          PopularDataModel.fromJson(item),
        );
      });
    } else {
      print(json.decode(response.body));
    }
  } on SocketException {
    print('Network error');
  } catch (e) {
    print(e.toString());
  }
  searchDataLoading = false;
  notifyListeners();
}

}