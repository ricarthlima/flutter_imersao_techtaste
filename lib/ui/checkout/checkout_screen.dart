import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

import '../../models/dish.dart';
import '../_core/app_colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sacola"),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Limpar",
              style: TextStyle(color: AppColors.mainColor),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                "Pedidos",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "Pagamentos",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "Entregar no endereço:",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "Confirmar",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundLightColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  spacing: 8,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pedido:"),
                        Text(
                          "R\$ ${getTotalPrice(bagProvider.listDishesOnBag).toStringAsFixed(2)}",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Entrega:"), Text("R\$ 6.00")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pedido:"),
                        Text(
                          "R\$ ${(getTotalPrice(bagProvider.listDishesOnBag) + 6).toStringAsFixed(2)}",
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wallet,
                            color: Colors.black,
                          ),
                          Text("Pedir"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double getTotalPrice(List<Dish> listDish) {
    double total = 0;
    for (Dish dish in listDish) {
      total += dish.price;
    }
    return total;
  }
}
