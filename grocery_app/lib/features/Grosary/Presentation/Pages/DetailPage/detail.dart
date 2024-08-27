import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/Grosary/Domein/Entity/grocery_entity.dart';
import 'package:grocery_app/features/Grosary/Presentation/bloc/grocery_bloc.dart';
import 'package:grocery_app/features/Grosary/Presentation/bloc/grocery_event.dart';

class DetailPage extends StatefulWidget {
  final GroceryEntity grocery;

  const DetailPage({Key? key, required this.grocery}) : super(key: key);


  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int orderCount = 1;

  void incrementOrder() {
    setState(() {
  context.read<GroceryBloc>().add(LoadAllGroceryEvent());

      orderCount++;
    });
  }

  void decrementOrder() {
    setState(() {
      if (orderCount > 1) orderCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      widget.grocery.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 300,
                    ),
                  ),
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.grocery.title,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text(
                          '£${(widget.grocery.price + widget.grocery.discount).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          '£${widget.grocery.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange),
                        const SizedBox(width: 4.0),
                        Text(
                          widget.grocery.rating.toString(),
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      widget.grocery.description,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Additional Options : ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Column(
                      children: widget.grocery.options.map((option) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  option.name,
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Text(
                                '£${option.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Checkbox(
                                value: false,
                                onChanged: (bool? value) {
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      height: 70,
                      padding: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12.0), 
            boxShadow: const [
               BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                offset: Offset(0, 4), 
              ),
            ],
          ),
                      child: Row(
                      
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            
                            children: [
                              IconButton(
                                
                                icon: const Icon(Icons.remove),
                                onPressed: decrementOrder,
                              ),
                              Text(
                                '$orderCount',
                                style: const TextStyle(fontSize: 18.0),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: incrementOrder,
                              ),
                            ],
                          ),
                          ElevatedButton(
                            
                            onPressed: () {
                           
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:const Color.fromARGB(255, 194, 72, 64),
                              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                            ),
                            child: const Text(
                              'Add to Basket',
                              style: TextStyle(fontSize: 16.0,color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
