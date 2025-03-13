class CategoryModel {
  String imagePath;
  String name;

  CategoryModel({required this.name})
      : imagePath = "assets/categories/${name.toLowerCase()}.png";
}
