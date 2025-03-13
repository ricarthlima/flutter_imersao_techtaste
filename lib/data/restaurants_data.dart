import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_imersao_techtaste/models/restaurant.dart';

class RestaurantsData extends ChangeNotifier {
  List<Restaurant> listRestaurant = [];

  Future<void> getRestaurants() async {
    listRestaurant = [];

    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> listRestaurantsData = jsonData["restaurants"];

    for (dynamic restaurantData in listRestaurantsData) {
      listRestaurant.add(Restaurant.fromMap(restaurantData));
    }

    notifyListeners();
  }
}
