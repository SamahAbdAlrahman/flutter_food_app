import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/categoryModel.dart';
import '../data/foodModel.dart';
import '../widgets_and_constants/constants.dart';
import '../widgets_and_constants/appBar.dart';
import 'details.dart';

class home extends StatefulWidget {
  @override
  homeState createState() => homeState();
}

class homeState extends State<home> {
  String? selectCategoryID;
  late List<FoodItem> filterFoods;
  late Box<FoodItem> favoritesBox;

  @override
  void initState() {
    super.initState();

    filterFoods = food; // جميع الأطعمة
    Hive.openBox<FoodItem>('favoritesBox').then((box) {
      setState(() {
        favoritesBox = box;
      });
    });
  }

  void addToFavorites(FoodItem food) {
    favoritesBox.add(food);
    setState(() {});
  }

  void removeFromFavorites(FoodItem food) {
    food.isFavorite.value = false;
    int index = favoritesBox.values.toList().indexOf(food);
    if (index != -1) {
      favoritesBox.deleteAt(index);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 22),
            ClipRRect(
              child: Image.asset("assets/classic_burger.jpg"),
              borderRadius: BorderRadius.circular(10.0),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      filterFoods = food.toList();
                    });
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Constants.secColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 41.0, horizontal: 22),
                      child: Column(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 10, top: 23, bottom: 23),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectCategoryID = Categories[index].id;
                                filterFoods = food.where((item) {
                                  return item.category.id == selectCategoryID;
                                }).toList();
                              });
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Categories[index].id == selectCategoryID
                                    ? Constants.mainColor
                                    : Constants.secColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 22),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Categories[index].ImageUrl,
                                      width: 48,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      Categories[index].name,
                                      style: TextStyle(fontSize: 14),
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
                ),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: filterFoods.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetailPage(food: filterFoods[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            filterFoods[index].imgUrl,
                            width: 160,
                            height: 90,
                          ),
                          Positioned(
                            top: -10,
                            right: -10,
                            child: ValueListenableBuilder(
                              valueListenable: filterFoods[index].isFavorite,
                              builder: (context, isFavorite, child) {
                                return IconButton(
                                  onPressed: () {
                                    filterFoods[index].isFavorite.value = !isFavorite;
                                    if (isFavorite) {
                                      removeFromFavorites(filterFoods[index]);
                                    } else {
                                      addToFavorites(filterFoods[index]);
                                    }
                                  },
                                  icon: Icon(
                                    isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: isFavorite ? Colors.red : Colors.black54,
                                    size: 30,
                                  ),
                                );
                              },
                            ),
                          )

                        ],
                      ),
                      Text(
                        filterFoods[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "\$${filterFoods[index].price.toStringAsFixed(2)}",
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
