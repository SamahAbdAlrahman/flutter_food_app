
import 'package:flutter/material.dart';

import '../data/categoryModel.dart';
import '../data/foodModel.js.dart';
import '../widgets_and_constants/constants.dart';
import '../widgets_and_constants/appBar.dart';




class home extends StatefulWidget{
  @override
  homeState createState() => homeState();

}
class homeState  extends State<home>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:AppBarWidget() ,
        drawer: Drawer(
          child: Column(
            children: [
              Text("data")
            ],
          ),
        ),
        backgroundColor: Colors.white,

        // appBar: AppBar(
      //   title: Text('Home Page'),
      // ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            SizedBox(height: 22,),
            ClipRRect(
              child: Image.asset("assets/classic_burger.jpg"),
                borderRadius: BorderRadius.circular(10.0),
            ),

            SizedBox(
              height: 135,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 30 , top: 26 ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            Categories[index].ImageUrl,
                            width: 48,
                            height: 50,
                            // fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8),
                          Text(
                            Categories[index].name,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                ),
                itemBuilder: (context, index) {
                  return Column(
                  children: [

                                Image.network(
                                  food[index].imgUrl,
                                  width: 160,
                                  height: 80,
                                  // fit: BoxFit.cover,
                                ),
                  Text(
                                    food[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "\$${food[index].price.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    food[index].description,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                  ],
                  );
                },
                itemCount: food.length, // عدد العناصر
              ),
            )



          ],

        ),
      )
    );
  }

}
