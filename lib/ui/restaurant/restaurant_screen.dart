import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/models/dish.dart';
import 'package:flutter_imersao_techtaste/models/restaurant.dart';
import 'package:flutter_imersao_techtaste/ui/_core/widgets/appbar.dart';
import 'package:flutter_imersao_techtaste/ui/restaurant/widgets/dish_widget.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              SizedBox(height: 16),
              Center(
                child: Image.asset(
                  "assets/${restaurant.imagePath}",
                  width: 160,
                ),
              ),
              Text(
                "Mais pedidos",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Column(
                spacing: 32,
                children: List.generate(
                  restaurant.listDishes.length,
                  (index) {
                    Dish dish = restaurant.listDishes[index];
                    return DishWidget(
                      dish: dish,
                      restaurantName: restaurant.name,
                    );
                  },
                ),
              ),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
