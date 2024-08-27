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
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<GroceryBloc>().add(LoadAllGroceryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: RefreshIndicator(
        onRefresh: () {
          context.read<GroceryBloc>().add(LoadAllGroceryEvent());
          return Future.delayed(const Duration(seconds: 2));
        },
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.tune_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (query) {
                    setState(() {
                      _searchQuery = query.toLowerCase();
                    });
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<GroceryBloc, GroceryState>(
                  builder: (context, state) {
                    if (state is GroceryLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GroceryLoaded) {
                      final filteredData = state.data.where((grocery) {
                        return grocery.title.toLowerCase().contains(_searchQuery);
                      }).toList();

                      if (filteredData.isEmpty) {
                        return const Center(
                          child: Text('No products found'),
                        );
                      }

                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          final grocery = filteredData[index];
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
