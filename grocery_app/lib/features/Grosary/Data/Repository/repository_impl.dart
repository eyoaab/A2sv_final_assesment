import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/Exception/exception.dart';
import 'package:grocery_app/core/Faliure/faliure.dart';
import 'package:grocery_app/core/Network_info/Network_info.dart';
import 'package:grocery_app/features/Grosary/Data/DataSource/remote_data_source.dart';
import 'package:grocery_app/features/Grosary/Domein/Entity/grocery_entity.dart';
import 'package:grocery_app/features/Grosary/Domein/Repository/grocery_repositar.dart';


class GroceryRepositoryImpl extends GroceryRepository {
  final GroceryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GroceryRepositoryImpl(
      {required this.remoteDataSource,
      required this.networkInfo});

    @override
  Future<Either<Failure, List<GroceryEntity>>> getAllGroceries() async {
    try {
      final products = await remoteDataSource.getAllGroceries();
      return Right(products.map((product) => product.toEntity()).toList());
    } on ServerException {
      return const  Left(ServerFailure());
    } on SocketException {
      return  const Left(ConnectionFailure());
    }
  }   

  
  @override

  Future<Either<Failure, GroceryEntity>> getGroceryById(String id) async {
    try {
      final product = await remoteDataSource.getGroceriesById(id);
      return Right(product.toEntity());
    } on ServerException {
      return const Left(ServerFailure());
    } on SocketException {
      return const Left(ConnectionFailure());
    }
  } 



}

  