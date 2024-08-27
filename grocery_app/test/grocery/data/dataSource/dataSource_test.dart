import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_app/core/Constants/urls.dart';
import 'package:grocery_app/features/Grosary/Data/DataSource/remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:grocery_app/features/Grosary/Data/Model/grocery_model.dart';
import 'package:grocery_app/core/Exception/exception.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late GroceryRemoteDataSourceImpl groceryRemoteDataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    groceryRemoteDataSource = GroceryRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getAllGroceries', () {
    final tGroceryList = [
      GroceryModel(
        id: '66be460f71fccd1506882d24',
        title: 'Chicken Burger',
        imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747446/assessment/xhvgqvpt7pghwaeqnids.jpg',
        rating: 4.9,
        price: 11,
        discount: 6,
        description: 'A delicious chicken burger...',
        options: [],
      ),
      // Add other GroceryModel instances as needed.
    ];

    test('should return a list of GroceryModel when the response code is 200', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(Urls.getAll()), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(
                jsonEncode({
                  "statusCode": 200,
                  "message": "",
                  "data": tGroceryList.map((grocery) => grocery.toJson()).toList(),
                }),
                200,
              ));

      // Act
      final result = await groceryRemoteDataSource.getAllGroceries();

      // Assert
      expect(result, tGroceryList);
    });

    test('should throw a ServerException when the response code is not 200', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(Urls.getAll()), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // Act
      final call = groceryRemoteDataSource.getAllGroceries();

      // Assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('getGroceriesById', () {
    final tGrocery = GroceryModel(
      id: '66be460f71fccd1506882d24',
      title: 'Chicken Burger',
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747446/assessment/xhvgqvpt7pghwaeqnids.jpg',
      rating: 4.9,
      price: 11,
      discount: 6,
      description: 'A delicious chicken burger...',
      options: [],
    );

    test('should return a GroceryModel when the response code is 200', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(Urls.getAll()), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(
                jsonEncode({
                  "statusCode": 200,
                  "message": "",
                  "data": tGrocery.toJson(),
                }),
                200,
              ));

      // Act
      final result = await groceryRemoteDataSource.getGroceriesById(tGrocery.id);

      // Assert
      expect(result, tGrocery);
    });

    test('should throw a ServerException when the response code is not 200', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(Urls.getAll()), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // Act
      final call = groceryRemoteDataSource.getGroceriesById(tGrocery.id);

      // Assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
