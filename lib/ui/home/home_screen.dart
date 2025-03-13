import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/data/categories_data.dart';
import 'package:flutter_imersao_techtaste/data/restaurants_data.dart';
import 'package:flutter_imersao_techtaste/models/category.dart';
import 'package:flutter_imersao_techtaste/models/restaurant.dart';
import 'package:flutter_imersao_techtaste/ui/_core/app_colors.dart';
import 'package:flutter_imersao_techtaste/ui/home/widgets/category_widget.dart';
import 'package:flutter_imersao_techtaste/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantsData restaurantsData = Provider.of<RestaurantsData>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
          )
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  width: 147,
                ),
              ),
              Text(
                "Boas vindas!",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: "O que você quer comer?",
                  labelStyle: TextStyle(color: AppColors.mainLightColor),
                ),
              ),
              Text(
                "Escolha por categoria",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 16,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      CategoryModel category =
                          CategoriesData.listCategories[index];
                      return CategoryWidget(category: category);
                    },
                  ),
                ),
              ),
              Image.asset(
                "assets/banners/banner_promo.png",
              ),
              Text(
                "Bem avaliados",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Column(
                spacing: 16,
                children: List.generate(
                  restaurantsData.listRestaurant.length,
                  (index) {
                    Restaurant restaurant =
                        restaurantsData.listRestaurant[index];
                    return RestaurantWidget(restaurant: restaurant);
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
