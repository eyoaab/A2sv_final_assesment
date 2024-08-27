

import 'package:grocery_app/features/Grosary/Domein/Entity/grocery_entity.dart';
import 'package:dartz/dartz.dart'; 
import '../../../../core/Faliure/faliure.dart'; 

abstract class GroceryRepository {
  Future<Either<Failure, List<GroceryEntity>>> getAllGroceries();
  Future<Either<Failure, GroceryEntity>> getGroceryById(String id);
}
