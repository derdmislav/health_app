import 'package:flutter/foundation.dart';

import 'package:health_app/models/medicine.dart';
import 'package:hive/hive.dart';

class MedicineData extends ChangeNotifier {
  String _boxName = 'medicineBox';

  List<Food> _medicineList = [];

  Future<void> getMedicineList() async {
    var box = await Hive.openBox<Food>(_boxName);

    _medicineList = box.values.toList();
    notifyListeners();
  }

  Food getMedicineAtIndex(index) {
    return _medicineList[index];
  }

  int get medicineListLength => _medicineList.length;

  void addMedicine(Food newMedicine) async {
    var box = await Hive.openBox<Food>(_boxName);

    await box.add(newMedicine);

    _medicineList = box.values.toList();
    notifyListeners();
  }

  Future<List<Food>> getNextMedicineInfoIfScheduled() async {
    var box = await Hive.openBox<Food>(_boxName);

    List<Food> medicineList = box.values.toList();
    return medicineList;
  }
}
