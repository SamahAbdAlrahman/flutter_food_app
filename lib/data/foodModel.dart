
import 'package:flutter/cupertino.dart';

import 'categoryModel.dart';

class FoodItem {
  final String id;
  final String name;
  final String imgUrl;
  final double price;
  final CategoryModel category;
  final String description;
  ValueNotifier<bool> isFavorite;

  // Constructor
  FoodItem({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
    required this.category,
    this.description = 'This is description',
    bool isFavorite = false,  // Default value for isFavorite
  }) : isFavorite = ValueNotifier(isFavorite);

  @override
  String toString() {
    return 'FoodItem{name: $name, price: $price, isFavorite: $isFavorite}';
  }
}
List<FoodItem> favoritesList = [];

List<FoodItem> food = [
  FoodItem(
    id: '1',
    name: 'Beef Burger',
    imgUrl:
    'https://www.freepnglogos.com/uploads/burger-png/download-hamburger-burger-png-image-png-image-pngimg-15.png',
    price: 8.5,
    category: Categories[0],
  ),
  FoodItem(
    id: '2',
    name: 'Chicken Burger',
    imgUrl: 'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png',
    price: 9.5,
    category: Categories[0],
  ),
  FoodItem(
    id: '3',
    name: 'Cheese Burger',
    imgUrl: 'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png',
    price: 8,
    category: Categories[0],
  ),
  FoodItem(
    id: '4',
    name: 'Chicken Pizza',
    imgUrl:
    'https://graficsea.com/wp-content/uploads/2021/12/Chicken-Supreme-Pizza-.png',
    price: 9,
    category: Categories[1],
  ),
  FoodItem(
    id: '5',
    name: 'Pasta',
    imgUrl:
    'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
  ),
  FoodItem(
    id: '6',
    name: 'Pasta2',
    imgUrl:
    'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
  ),
  FoodItem(
    id: '7',
    name: 'Pasta3',
    imgUrl:
    'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
  ),
  FoodItem(
    id: '8',
    name: 'Pasta4',
    imgUrl:
    'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
  ),
];

