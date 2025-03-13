import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_imersao_techtaste/models/restaurant.dart';

class RestaurantsData {
  Future<List<Restaurant>> getRestaurants() async {
    List<Restaurant> listRestaurant = [];

    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> listRestaurantsData = jsonData["restaurants"];

    for (dynamic restaurantData in listRestaurantsData) {
      listRestaurant.add(Restaurant.fromMap(restaurantData));
    }

    return listRestaurant;
  }
}
