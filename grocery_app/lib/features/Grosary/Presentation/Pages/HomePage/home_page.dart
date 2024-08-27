


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/features/Grosary/Presentation/Widgets/grocery_card.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => HomePage())
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    
      return Scaffold( backgroundColor: const Color.fromARGB(255, 255, 255, 255),

     body: GridView.count(
        
      crossAxisCount: 2,
      // padding: const EdgeInsets.all(8.0),
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      childAspectRatio: 0.59,
      children: List.generate(20, (index) {
        return Container(
          padding: EdgeInsets.zero,
          child: const GroceryCard(id: 'normal id', 
          title: 'eyob', 
          imageUrl: 'assets/splash.jpeg', 
          rating: 3, 
          oldPrice: 80, 
          newPrice: 1)
        );
      }),
    ));
  }
}