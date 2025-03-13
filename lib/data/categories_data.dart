import 'package:flutter_imersao_techtaste/models/category.dart';

abstract class CategoriesData {
  static List<CategoryModel> listCategories = [
    CategoryModel(name: "Petiscos"),
    CategoryModel(name: "Principais"),
    CategoryModel(name: "Massas"),
    CategoryModel(name: "Sobremesas"),
    CategoryModel(name: "Bebidas"),
  ];
}
