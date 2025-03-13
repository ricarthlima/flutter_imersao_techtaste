import 'dart:convert';

class Restaurant {
  String id;
  String imagePath;
  String name;
  String description;
  double stars;
  double distance;
  List<String> categories;

  Restaurant({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.stars,
    required this.distance,
    required this.categories,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'description': description,
      'stars': stars,
      'distance': distance,
      'categories': categories,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as String,
      imagePath: map['imagePath'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      stars: map['stars'] as double,
      distance: map['distance'] as double,
      categories: List<String>.from((map['categories'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) => Restaurant.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
