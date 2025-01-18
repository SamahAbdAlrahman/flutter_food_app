
import 'package:flutter/material.dart';
import 'package:food_app/widgets_and_constants/drawer_widget.dart';

import '../data/categoryModel.dart';
import '../data/foodModel.js.dart';
import '../widgets_and_constants/constants.dart';
import '../widgets_and_constants/appBar.dart';




class home extends StatefulWidget{
  @override
  homeState createState() => homeState();

}
class homeState  extends State<home>{
  String? selectCategoryID ;
  late List <FoodItem> filterFoods;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterFoods=food; // all food

  }
  @override
  Widget build(BuildContext context) {

    return Container(
                color: Colors.white,

        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 22,),
              ClipRRect(
                child: Image.asset("assets/classic_burger.jpg"),
                  borderRadius: BorderRadius.circular(10.0),
              ),

              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10 , top: 23,bottom: 23  ),
                      child: GestureDetector(
                        onTap: (){
setState(() {
  selectCategoryID=Categories[index].id;

  print(Categories[index].name);
  print(Categories[index].id);

  filterFoods = food.where((item){
return item.category.id ==selectCategoryID;
  }).toList();



});                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Categories[index].id==selectCategoryID
                                ?Constants.mainColor
                                :Constants.secColor


                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 22),
                            child: Column(
                              children: [
                                Image.asset(
                                  Categories[index].ImageUrl,
                                  width: 48,
                                  // height: 50,
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
                        ),
                      ),
                    );
                  },
                ),
              ),

              GridView.builder(
                shrinkWrap: true, // حتى GridView تاخذ فقط المساحة المطلوبة

                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                ),
                itemBuilder: (context, index) {
                  return Column(
                  children: [

                                Image.network(
                                  filterFoods[index].imgUrl,
                                  width: 160,
                                  height: 80,
                                  // fit: BoxFit.cover,
                                ),
                  Text(
                    filterFoods[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "\$${filterFoods[index].price.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    filterFoods[index].description,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                  ],
                  );
                },
                itemCount: filterFoods.length, // عدد العناصر
              )



            ],

          ),
        ),
      );
    
  }

}
