import 'package:grocery_app/features/Grosary/Domein/Entity/OptionEntity.dart';
import 'package:grocery_app/features/Grosary/Domein/Entity/grocery_entity.dart';

class GroceryModel extends GroceryEntity {
  GroceryModel({
    required String id,
    required String title,
    required String imageUrl,
    required double rating,
    required double price,
    required double discount,
    required String description,
    required List<OptionEntity> options,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          rating: rating,
          price: price,
          discount: discount,
          description: description,
          options: options,
        );


  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    return GroceryModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      rating: (json['rating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      description: json['description'],
      options: (json['options'] as List)
          .map((option) => OptionEntity(
                id: option['id'],
                name: option['name'],
                price: (option['price'] as num).toDouble(),
              ))
          .toList(),
    );
  }

  // Method to convert GroceryModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'rating': rating,
      'price': price,
      'discount': discount,
      'description': description,
      'options': options
          .map((option) => {
                'id': option.id,
                'name': option.name,
                'price': option.price,
              })
          .toList(),
    };
  }

  // Method to convert GroceryModel to GroceryEntity
  GroceryEntity toEntity() {
    return GroceryEntity(
      id: id,
      title: title,
      imageUrl: imageUrl,
      rating: rating,
      price: price,
      discount: discount,
      description: description,
      options: options,
    );
  }


  static List<GroceryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => GroceryModel.fromJson(json)).toList();
  }
}
