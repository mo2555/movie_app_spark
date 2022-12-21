import 'package:flutter/material.dart';

class AppConstants {
  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static const String apiKey = '2a81b0f3fbbe3656bd9be040bdeed583';
}
