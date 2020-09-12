import 'package:flutter/foundation.dart';

import 'step_count.dart';
import 'package:hive/hive.dart';

class StepCountData extends ChangeNotifier {
  String _boxName = 'stepsBox';

  List<StepCount> _stepCounts = [];

  StepCount _activeSteps;

  void getStepCounts() async {
    var box = await Hive.openBox<StepCount>(_boxName);

    _stepCounts = box.values.toList();
    notifyListeners();
  }

  StepCount getStepCount(index) {
    return _stepCounts[index];
  }

  int get stepLength {
    return _stepCounts.length;
  }

  void addSteps(StepCount newStepCount) async {
    var box = await Hive.openBox<StepCount>(_boxName);

    await box.add(newStepCount);

    _stepCounts = box.values.toList();
    notifyListeners();
  }

  void deleteStepCount(key) async {
    var box = await Hive.openBox<StepCount>(_boxName);

    await box.delete(key);

    _stepCounts = box.values.toList();

    notifyListeners();
  }

  void editStepCount({StepCount stepCount, int stepCountKey}) async {
    var box = await Hive.openBox<StepCount>(_boxName);

    await box.put(stepCountKey, stepCount);

    _stepCounts = box.values.toList();

    _activeSteps = box.get(stepCountKey);

    notifyListeners();
  }

  void setActiveContact(key) async {
    var box = await Hive.openBox<StepCount>(_boxName);
    _activeSteps = box.get(key);
    notifyListeners();
  }

  /// Get Active Contact
  StepCount getActiveContact() {
    return _activeSteps;
  }
}
