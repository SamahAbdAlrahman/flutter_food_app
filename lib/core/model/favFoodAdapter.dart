
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/categoryModel.dart';
import '../../data/foodModel.dart';


class FoodItemAdapter extends TypeAdapter<FoodItem> {
  @override
  final typeId = 0;

  @override
  FoodItem read(BinaryReader reader) {
    return FoodItem(
      id: reader.readString(),
      name: reader.readString(),
      imgUrl: reader.readString(),
      price: reader.readDouble(),
      isFavorite: reader.readBool(),
            description: reader.readString(),

      category: CategoryModel(
        id: reader.readString(),
        name: reader.readString(),
        ImageUrl: reader.readString(),
      ),    );
  }

  @override
  void write(BinaryWriter writer, FoodItem obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.imgUrl);
    writer.writeDouble(obj.price);
    writer.writeBool(obj.isFavorite.value);
    writer.writeString(obj.category.id);
    writer.writeString(obj.category.name);
        writer.writeString(obj.category.ImageUrl);
    writer.writeString(obj.description);

  }
}
