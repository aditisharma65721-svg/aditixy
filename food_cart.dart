import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../screens/food_details_screen.dart';

class FoodCard extends StatelessWidget {
  final FoodItem food;
  FoodCard({required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(food.imageUrl, width: 50, height: 50),
        title: Text(food.name),
        subtitle: Text("₹${food.price}"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailsScreen(food: food),
            ),
          );
        },
      ),
    );
  }
}
