import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/ui/_core/app_theme.dart';
import 'package:flutter_imersao_techtaste/ui/_core/dimensions.dart';

import '../../models/dish.dart';

class DishScreen extends StatefulWidget {
  final Dish dish;
  final String restaurantName;
  const DishScreen({
    super.key,
    required this.dish,
    required this.restaurantName,
  });

  @override
  State<DishScreen> createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.restaurantName)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(height: 16),
                  Text(
                    widget.dish.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "R\$${widget.dish.price.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Text(widget.dish.description),
              Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                    onPressed: () => _removeAmount(),
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    style: AppTheme.iconButtonStylized,
                  ),
                  Text(
                    amount.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton.filled(
                    onPressed: () => _addAmount(),
                    icon: Icon(Icons.arrow_drop_up_sharp),
                    style: AppTheme.iconButtonStylized,
                  ),
                ],
              ),
              SizedBox(
                width: width(context),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Adicionar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addAmount() {
    setState(() {
      amount++;
    });
  }

  void _removeAmount() {
    setState(() {
      amount = max(1, amount - 1);
    });
  }
}
