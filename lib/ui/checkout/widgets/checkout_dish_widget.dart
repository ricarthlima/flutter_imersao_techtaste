import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/models/dish.dart';
import 'package:flutter_imersao_techtaste/ui/_core/app_theme.dart';

import '../../_core/app_colors.dart';

class CheckoutDishWidget extends StatelessWidget {
  final Dish dish;
  final int amount;
  final Function onAddPressed;
  final Function onRemovePressed;
  const CheckoutDishWidget({
    super.key,
    required this.dish,
    required this.amount,
    required this.onAddPressed,
    required this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLightColor,
        borderRadius: BorderRadius.circular(16),
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 16,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    "assets/dishes/default.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text(
                    dish.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: IconButton.filled(
                    onPressed: () => onAddPressed.call(),
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.arrow_drop_up),
                    style: AppTheme.iconButtonStylized,
                  ),
                ),
                Text(amount.toString()),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: IconButton.filled(
                    onPressed: () => onRemovePressed.call(),
                    padding: EdgeInsets.zero,
                    icon: Center(child: Icon(Icons.arrow_drop_down)),
                    style: AppTheme.iconButtonStylized,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
