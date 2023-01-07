import 'package:flutter/material.dart';

import '../models/popular_data_model.dart';

class WatchlistProvider extends ChangeNotifier {
  List<PopularDataModel> watchlistData = [];

  addOrRemoveData({required PopularDataModel? model}) {
    if(model==null) return ;
    if (watchlistData.contains(model)) {
      watchlistData.remove(model);
    } else {
      watchlistData.add(model);
    }
    notifyListeners();
  }
}
