import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/ui/_core/app_colors.dart';
import 'package:flutter_imersao_techtaste/ui/dish/dish_screen.dart';

import '../../../models/dish.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;
  final String restaurantName;
  const DishWidget({
    super.key,
    required this.dish,
    required this.restaurantName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onDishPressed(context),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: SizedBox(
              height: 160,
              width: double.infinity,
              child: Expanded(
                child: Image.asset(
                  "assets/dishes/default.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: 160,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.backgroundLightColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  dish.name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text("R\$${dish.price.toStringAsFixed(2)}"),
                SizedBox(height: 16),
                Text(
                  "${dish.description.split(" ").sublist(0, 18).join(" ")}...",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onDishPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DishScreen(
            dish: dish,
            restaurantName: restaurantName,
          );
        },
      ),
    );
  }
}
