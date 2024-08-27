import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/Grosary/Presentation/Pages/DetailPage/detail.dart';
import 'package:grocery_app/features/Grosary/Presentation/Widgets/grocery_card.dart';
import 'package:grocery_app/features/Grosary/Presentation/bloc/grocery_bloc.dart';
import 'package:grocery_app/features/Grosary/Presentation/bloc/grocery_event.dart';
import 'package:grocery_app/features/Grosary/Presentation/bloc/grocery_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<GroceryBloc>().add(LoadAllGroceryEvent());
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: BlocBuilder<GroceryBloc, GroceryState>(
        builder: (context, state) {
          if (state is GroceryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GroceryLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1, 
              ),
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final grocery = state.data[index];
                return Container(
                  padding: EdgeInsets.zero,
                  child: GroceryCard(
                    id: grocery.id,
                    title: grocery.title,
                    imageUrl: grocery.imageUrl,
                    rating: grocery.rating,
                    oldPrice: grocery.price,
                    newPrice: grocery.price - grocery.discount,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(grocery: grocery),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is GroceryError) {
            return const Center(
              child: Text('Failed to load groceries'),
            );
          } else {
            return const Center(
              child: Text('Unknown state'),
            );
          }
        },
      ),
    );
  }
}
