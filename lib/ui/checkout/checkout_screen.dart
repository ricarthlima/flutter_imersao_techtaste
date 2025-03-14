import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/ui/_core/bag_provider.dart';
import 'package:flutter_imersao_techtaste/ui/checkout/widgets/checkout_dish_widget.dart';
import 'package:flutter_imersao_techtaste/ui/checkout/widgets/checkout_widget.dart';
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
            onPressed: () {
              _onCleanPressed(context);
            },
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
              if (bagProvider.listDishesOnBag.isNotEmpty)
                Column(
                  spacing: 16,
                  children: List.generate(
                    bagProvider.getMapByAmount().keys.length,
                    (index) {
                      Dish dish =
                          bagProvider.getMapByAmount().keys.toList()[index];

                      return CheckoutDishWidget(
                        dish: dish,
                        amount: bagProvider.getMapByAmount()[dish]!,
                        onAddPressed: () {},
                        onRemovePressed: () {},
                      );
                    },
                  ),
                ),
              if (bagProvider.listDishesOnBag.isEmpty)
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Text("Sacola vazia"),
                  ),
                ),
              Text(
                "Pagamentos",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              CheckoutWidget(
                onTap: () {},
                leading: Image.asset(
                  "assets/others/visa.png",
                  width: 30,
                ),
                child: Text("VISA Classic\n****-0976"),
              ),
              Text(
                "Entregar no endereço:",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              CheckoutWidget(
                onTap: () {},
                leading: Icon(
                  Icons.location_on,
                  size: 30,
                ),
                child: Text("Rua das Acácias, 28\nCasa 10"),
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

  void _onCleanPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Deseja limpar o carrinho?",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red[900],
        action: SnackBarAction(
          label: "Limpar",
          textColor: Colors.white,
          onPressed: () {
            context.read<BagProvider>().cleanDishes();
          },
        ),
      ),
    );
  }
}
