import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_spark/model/latest_model.dart';
import 'package:movie_app_spark/util/end_points.dart';

class APIProvider extends ChangeNotifier {
  getLatest() async {
    try {
      http.Response response = await http.get(Uri.parse(
          '${EndPoints.baseUrl}${EndPoints.latest}${EndPoints.apiKey}'));

      if (response.statusCode == 200) {
        LatestModel latestModel =
            LatestModel.fromJson(json.decode(response.body));

        print(latestModel.id);
      } else {
        print('error');
      }
    } on SocketException {
      print('network error');
    } catch (e) {
      print(e.toString());
    }
  }

  getNewRelease() async {
    try {
      http.Response response = await http.get(Uri.parse(
          '${EndPoints.baseUrl}${EndPoints.newRelease}${EndPoints.apiKey}'));

      if (response.statusCode == 200) {
        List<LatestModel> latestModel = [];

        json.decode(response.body)['results'].forEach((item) {
          latestModel.add(LatestModel.fromJson(item));
          notifyListeners();
        });
        print(latestModel.first.id);
      } else {
        print('error');
      }
    } on SocketException {
      print('network error');
    } catch (e) {
      print(e.toString());
    }
  }

  getRecommended() async {
    try {
      http.Response response = await http.get(Uri.parse(
          '${EndPoints.baseUrl}${EndPoints.recommended}${EndPoints.apiKey}'));

      if (response.statusCode == 200) {
        List<LatestModel> recom = [];
        json.decode(response.body)['results'].forEach((item){
          recom.add(LatestModel.fromJson(item));
          notifyListeners();
        });
        print(recom.first.rate);
      } else {
        print('error');
      }
    } on SocketException {
      print('network error');
    } catch (e) {
      print(e.toString());
    }
  }

  searchMovie({required String q}) async {
    try {
      http.Response response = await http.get(Uri.parse(
          '${EndPoints.baseUrl}${EndPoints.search}$q'));

      if (response.statusCode == 200) {
        List<LatestModel> searchList = [];
        json.decode(response.body)['results'].forEach((item){
          searchList.add(LatestModel.fromJson(item));
          notifyListeners();
        });
        print(searchList.first.id);
      } else {
        print('error');
      }
    } on SocketException {
      print('network error');
    } catch (e) {
      print(e.toString());
    }
  }

}
