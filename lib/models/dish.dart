import 'dart:convert';

class Dish {
  String id;
  String imagePath;
  String name;
  String description;
  int price;

  Dish({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      id: map['id'] as String,
      imagePath: map['imagePath'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dish.fromJson(String source) =>
      Dish.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Dish(id: $id, imagePath: $imagePath, name: $name, description: $description, price: $price)';
  }
}
