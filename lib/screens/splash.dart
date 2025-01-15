import 'package:flutter/material.dart';

import '../core/functions/navigator.dart';
import 'home.dart';

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
            title: 'taskite App',
            home: Scaffold(

body: MyBody(),
            )
                    );
    }
}
class MyBody extends StatefulWidget{
    @override
myState createState() => myState();
}

class myState extends State<MyBody> {
  void initState() {
    super.initState();



    Future.delayed(Duration(seconds: 5), () {

        pushReplace(context,home());
 
}

    
   
    
    );
  }
    @override
    Widget build(BuildContext context){
        return  Container(
          color: Colors.white,

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lottie.asset('assets/anim.json'),
                Text('Taskati'),
                Text('its time to be organized'),
              ],


            ),
          ),
        );



    }
}
