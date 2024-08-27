import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/Grosary/Domein/Entity/OptionEntity.dart';
import 'package:grocery_app/features/Grosary/Domein/Entity/grocery_entity.dart';
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



  @override
  Widget build(BuildContext context) {
     
    return BlocProvider(
      create: (context) => sl<GroceryBloc>(),
       child: MaterialApp(home: SplashScreen()),
    );
  }
}
