import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_spark/models/movie_data_model.dart';
import 'package:movie_app_spark/utils/app_constants/app_constants.dart';
import 'package:movie_app_spark/utils/end_points/end_points.dart';

class GetMoviesProvider extends ChangeNotifier {
  MovieDataModel? movieDataModelLatest;

  bool loading = false;

  getLatest() async {
    loading = true;
    notifyListeners();
    try {
      http.Response response = await http.get(
        Uri.parse(
          '${EndPoints.baseUrl}${EndPoints.movie}${EndPoints.latest}?api_key=${AppConstants.apiKey}',
        ),
      );

      if (response.statusCode == 200) {
        movieDataModelLatest =
            MovieDataModel.fromJson(json.decode(response.body));
        loading = false;
        notifyListeners();
      }else{
        print(json.decode(response.body));
        loading = false;
        notifyListeners();
      }
    } on SocketException {
      Fluttertoast.showToast(
        msg: "Network Error!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      loading = false;
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      loading = false;
      notifyListeners();
    }
  }
}

/*
{
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  }
 */
