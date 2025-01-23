import 'package:flutter/material.dart';
import 'package:food_app/data/foodModel.dart';
import 'package:food_app/widgets_and_constants/constants.dart';

class FoodDetailPage extends StatelessWidget {
  final FoodItem food;

  FoodDetailPage({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.secColor,

        title: Text(food.name,style: TextStyle(color: Constants.blackColor),) ,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),

            Image.network(
              food.imgUrl,
              width: double.infinity,
              height: 200,

              // fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              food.name,
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold,color: Constants.mainColor),
            ),
            SizedBox(height: 10),
            Text(
              "\$${food.price.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 20),
            Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              food.description,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
