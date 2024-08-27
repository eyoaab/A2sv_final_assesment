import 'dart:convert';
import 'dart:developer';
import 'package:grocery_app/core/Constants/urls.dart';
import 'package:grocery_app/core/Exception/exception.dart';
import 'package:grocery_app/features/Grosary/Data/Model/grocery_model.dart';
import 'package:http/http.dart' as http;


abstract class GroceryRemoteDataSource {
  Future<List<GroceryModel>> getAllGroceries();
  Future<GroceryModel> getGroceriesById(String id);

}

class GroceryRemoteDataSourceImpl extends GroceryRemoteDataSource {
  
  final http.Client client;
  GroceryRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<GroceryModel>> getAllGroceries() async {
    try {

      final response = await client.get(
        Uri.parse(
          Urls.getAll(),
        ),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      
      if (response.statusCode == 200) {
        final List<dynamic> GroceryData = jsonResponse['data'];
        // log('form data source0');
        final List<GroceryModel> Groceries = [];
          //  Groceries.addAll(GroceryData.map((json) => GroceryModel.fromJson(json)).toList()) ;

           GroceryData.forEach((grocery) {
            // print(GroceryModel.fromJson(grocery).toString());
            Groceries.add(GroceryModel.fromJson(grocery));

           });




        return Groceries;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }




////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Future<GroceryModel> getGroceriesById(String id) async {
    try {
      final response = await client.get(
        Uri.parse(
          Urls.getById(id),
        ),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        final GroceryData = jsonResponse['data'];
        return GroceryModel.fromJson(
          GroceryData,
        );
      } else {
        throw ServerException();
      }
    } catch (_) {
      throw ServerException();
    }
  }
}