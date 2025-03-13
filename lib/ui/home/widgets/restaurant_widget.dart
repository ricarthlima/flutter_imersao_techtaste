import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/models/restaurant.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Text(restaurant.name);
  }
}
