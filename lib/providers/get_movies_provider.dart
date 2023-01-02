import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_spark/models/popular_data_model.dart';
import 'package:movie_app_spark/utils/app_constants/app_constants.dart';
import 'package:movie_app_spark/utils/end_points/end_points.dart';

import '../models/latest_data_model.dart';

class GetMoviesProvider extends ChangeNotifier {

  bool getLatestLoading = false;
  
  LatestDataModel? latestDataModel;
  
getLatest()async{
  getLatestLoading = true;
  notifyListeners();
  try{
    http.Response response = await http.get(
      Uri.parse("${EndPoints.baseUrl}${EndPoints.movie}${EndPoints.latest}?api_key=${AppConstants.apiKey}"),
    );
    if(response.statusCode==200){
      latestDataModel = LatestDataModel.fromJson(json.decode(response.body));
      print(latestDataModel!.id);
      notifyListeners();
    }else{
      print(json.decode(response.body));
    }
    getLatestLoading = false;
    notifyListeners();
  }on SocketException{
    getLatestLoading = false;
    notifyListeners();
  }catch(e){
    getLatestLoading = false;
    notifyListeners();
  }
}

  bool getPopularLoading = false;

  List<PopularDataModel> popularDataModel = [];

  getPopular()async{
    getPopularLoading = true;
    notifyListeners();
    try{
      http.Response response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.movie}${EndPoints.popular}?api_key=${AppConstants.apiKey}"),
      );
      if(response.statusCode==200){
        json.decode(response.body)['results'].forEach((item){
          popularDataModel.add(PopularDataModel.fromJson(item));
        });
        print(popularDataModel[0].title);
        notifyListeners();
      }else{
        print(json.decode(response.body));
      }
      getPopularLoading = false;
      notifyListeners();
    }on SocketException{
      getPopularLoading = false;
      notifyListeners();
    }

  }

  bool getTopRatedLoading = false;

  LatestDataModel? topRatedDataModel;

  getTopRated()async{
    getLatestLoading = true;
    notifyListeners();
    try{
      http.Response response = await http.get(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.movie}${EndPoints.latest}?api_key=${AppConstants.apiKey}"),
      );
      if(response.statusCode==200){
        latestDataModel = LatestDataModel.fromJson(json.decode(response.body));
        print(latestDataModel!.id);
        notifyListeners();
      }else{
        print(json.decode(response.body));
      }
      getLatestLoading = false;
      notifyListeners();
    }on SocketException{
      getLatestLoading = false;
      notifyListeners();
    }catch(e){
      getLatestLoading = false;
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