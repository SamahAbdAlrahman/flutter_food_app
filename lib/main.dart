import 'package:flutter/material.dart';
import 'package:food_app/screens/home.dart';
import 'package:food_app/screens/splash.dart';
import 'package:food_app/widgets_and_constants/bottomBar.dart';

import 'core/model/favFoodAdapter.dart';
import 'data/foodModel.dart';

import 'package:hive_flutter/hive_flutter.dart';

// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
void main()
// {
async{
  await Hive.initFlutter();
  Hive.registerAdapter(FoodItemAdapter());
  await Hive.openBox<FoodItem>("favoritesBox");
  // await Hive.deleteFromDisk();


  runApp(MyApp());
  }
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: splash(), //
      home: BottomNavbar(),

    );
  }
}


















