import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/data/categories_data.dart';
import 'package:flutter_imersao_techtaste/models/category.dart';
import 'package:flutter_imersao_techtaste/ui/home/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text("Boas vindas!"),
              TextFormField(),
              Text("Escolha por categoria"),
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
              Image.asset("assets/banners/banner_promo.png"),
              Text("Bem avaliados"),
            ],
          ),
        ),
      ),
    );
  }
}
