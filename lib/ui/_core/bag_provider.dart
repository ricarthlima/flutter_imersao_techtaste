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
}
