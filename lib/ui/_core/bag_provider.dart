import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/models/dish.dart';

class BagProvider extends ChangeNotifier {
  final List<Dish> listDishesOnBag = [];

  addAllDishes(List<Dish> dishes) {
    listDishesOnBag.addAll(dishes);
    notifyListeners();
  }

  removeDish(Dish dish) {
    listDishesOnBag.remove(dish);
    notifyListeners();
  }

  Map<Dish, int> getMapByAmount() {
    Map<Dish, int> mapResult = {};

    for (Dish dish in listDishesOnBag) {
      if (mapResult[dish] == null) {
        mapResult[dish] = 1;
      } else {
        mapResult[dish] = mapResult[dish]! + 1;
      }
    }

    return mapResult;
  }

  cleanDishes() {
    listDishesOnBag.removeWhere((dish) => true);
    notifyListeners();
  }
}
