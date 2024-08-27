import 'package:grocery_app/features/Grosary/Domein/Entity/grocery_entity.dart';

class GroceryState {}

final class GroceryInitial extends GroceryState {}

final class GroceryLoadingState extends GroceryState {}

final class GroceryLoaded extends GroceryState {
   final List<GroceryEntity> data;
    GroceryLoaded({required this.data }); 
}

final class GroceryError extends GroceryState {
   final String message;
    GroceryError({required this.message }); 
}
