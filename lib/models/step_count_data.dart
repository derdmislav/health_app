import 'package:flutter/foundation.dart';

import 'step_count.dart';
import 'package:hive/hive.dart';

class StepCountData extends ChangeNotifier {
  String _boxName = 'stepsBox';

  List<StepCount> _stepCounts = [];

  StepCount _activeSteps;

  Future<void> getStepCounts() async {
    var box = await Hive.openBox<StepCount>(_boxName);

    _stepCounts = box.values.toList();
    notifyListeners();
  }

  StepCount getStepCount(index) {
    return _stepCounts[index];
  }

  int get stepLength => _stepCounts.length;

  void addSteps(StepCount newStepCount) async {
    var box = await Hive.openBox<StepCount>(_boxName);

    await box.add(newStepCount);

    _stepCounts = box.values.toList();
    notifyListeners();
  }

  Future<StepCount> getLastStep() async {
    var box = await Hive.openBox<StepCount>(_boxName);

    _stepCounts = box.values.toList();

    if(_stepCounts!=null && _stepCounts.isNotEmpty)
    return _stepCounts.last;
    return StepCount(steps: 0,dateTime: null);
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

  Future<String> getDailySteps() async {
    var box = await Hive.openBox<StepCount>(_boxName);
    _stepCounts = box.values.toList();

    if (_stepCounts == null) return 'Something\'s wrong';
    int stepCountsLength= _stepCounts.length;
    if (_stepCounts.length < 2) return _stepCounts.first.steps.toString();
    if (_stepCounts.length == 2) return (_stepCounts.last.steps - _stepCounts[stepCountsLength-2].steps).toString();

    return _stepCounts.last.steps.toString();
  }
}
