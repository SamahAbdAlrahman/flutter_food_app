import 'package:flutter/material.dart';

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'taskite App',
      home: Scaffold(
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  MyState createState() => MyState();
}

class MyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عدد الأعمدة
          crossAxisSpacing: 10, // مسافة بين الأعمدة
          mainAxisSpacing: 10, // مسافة بين الصفوف
          childAspectRatio: 1, // نسبة العرض إلى الارتفاع
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.orange,
            child: Center(child: Text('Item $index')),
          );
        },
        itemCount: 20, // عدد العناصر
      )



    );
  }
}
