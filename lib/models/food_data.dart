import 'package:flutter/foundation.dart';

import 'package:health_app/models/food.dart';
import 'package:hive/hive.dart';

class FoodData extends ChangeNotifier {
  String _boxName = 'foodBox';

  List<Food> _foodList = [];

  Future<void> getFoodList() async {
    var box = await Hive.openBox<Food>(_boxName);

    _foodList = box.values.toList();
    notifyListeners();
  }

  Food getFoodAtIndex(index) {
    return _foodList[index];
  }

  int get foodListLength => _foodList.length;

  void addFood(Food newFood) async {
    var box = await Hive.openBox<Food>(_boxName);

    await box.add(newFood);

    _foodList = box.values.toList();
    notifyListeners();
  }
}
