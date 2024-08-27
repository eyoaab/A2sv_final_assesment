import 'OptionEntity.dart';
// Grocery Item Class
class GroceryEntity {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final double price;
  final double discount;
  final String description;
  final List<OptionEntity> options;


  GroceryEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.options,
  });
}