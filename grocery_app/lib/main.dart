import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/Grosary/Domein/Entity/OptionEntity.dart';
import 'package:grocery_app/features/Grosary/Domein/Entity/grocery_entity.dart';
import 'package:grocery_app/features/Grosary/Presentation/Pages/DetailPage/detail.dart';
import 'package:grocery_app/features/Grosary/Presentation/Pages/HomePage/home_page.dart';
import 'package:grocery_app/features/Grosary/Presentation/Pages/SplashScreen/splash_screen.dart';
import 'package:grocery_app/features/Grosary/Presentation/bloc/grocery_bloc.dart';
import 'package:grocery_app/injection_container.dart';


Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final grocery = GroceryEntity(
    id: '1',
    title: 'Fresh Apple',
    imageUrl: 'assets/splash.jpeg',
    rating: 4.5,
    price: 10.0,
    discount: 2.0,
    description: 'Fresh and juicy apples straight from the farm.',
    options: [
      OptionEntity(id: '1', name: 'Pack of 1', price: 3.0),
      OptionEntity(id: '2', name: 'Pack of 3', price: 8.0),
      OptionEntity(id: '3', name: 'Pack of 5', price: 12.0),
    ],
  );


  @override
  Widget build(BuildContext context) {
     
    return BlocProvider(
      create: (context) => sl<GroceryBloc>(),
       child: MaterialApp(home: SplashScreen()),
      // child: MaterialApp(home: DetailPage(grocery: grocery)),
    );
  }
}
