import 'package:flutter/material.dart';

class GroceryCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final double oldPrice;
  final double newPrice;

  const GroceryCard({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.oldPrice,
    required this.newPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: const EdgeInsets.all(8.0),
      // padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
          ClipRRect(
            borderRadius: const  BorderRadius.all(Radius.circular(10)),
            
            child: Image.asset(
              imageUrl,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
           Padding(
          padding:  const EdgeInsets.only(left: 6),
            
              child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

              children: [
              Text(
              title,
              style: const TextStyle(  
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 34, 34, 34),
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
                       ),
                       const SizedBox(height: 5),
             
                       // Rating Section
                       Row(
              children: [
               const  Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),
                const SizedBox(width: 5),
                Text(
                  rating.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
                       ),
                       const SizedBox(height: 8),
             
                       // Price Section
                       Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (oldPrice == 0)
                  // Only display new price if old price is zero
                  Text(
                     
                    '£${newPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                else
                  // Display both old and new prices
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '£${oldPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 226, 223, 223),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                       const SizedBox(width: 45),
             
                      Text(
                        '£${newPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
              ],
                       ),
                       ],),
           )
        ],
      ),
    );
  }
}
