import 'package:flutter/material.dart';
import 'package:food_app/screens/home.dart';
import 'package:food_app/screens/splash.dart';

// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
void main() {
// async{
  // بالعادة لما استخدم async
  // في المين
  // WidgetsFlutterBinding.ensureInitialized();

  //
  // Hive.registerAdapter(TaskAdapter());
  // await Hive.initFlutter();
  // await Hive.openBox("user");

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
      home: home(),
    );
  }
}





















