import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:food_app/data/foodModel.dart';

import 'details.dart';

class Fav extends StatefulWidget {
  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  late Future<Box<FoodItem>> favoritesBoxFuture;

  @override
  void initState() {
    super.initState();
    favoritesBoxFuture = _initializeHive();
  }

  Future<Box<FoodItem>> _initializeHive() async {
    return await Hive.openBox<FoodItem>('favoritesBox');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box<FoodItem>>(
      future: favoritesBoxFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final favoritesBox = snapshot.data;

        return Container(
          child: favoritesBox!.isEmpty
              ? Center(child: Text("No Favorites Yet!"))
              : ListView.builder(
            itemCount: favoritesBox.length,
            itemBuilder: (context, index) {
              final foodItem = favoritesBox.getAt(index);

              return ListTile(
                title: Text(foodItem!.name),
                leading: Image.network(foodItem.imgUrl),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetailPage(food: foodItem),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      favoritesBox.deleteAt(index);
                    });
                  },
                ),
              )
;
            },
          ),
        );
      },
    );
  }
}
