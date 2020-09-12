import 'package:hive/hive.dart';

part 'step_count.g.dart';

@HiveType(typeId: 0)
class StepCount {
  @HiveField(0)
  DateTime dateTime;
  @HiveField(1)
  int steps;

  StepCount({
    this.steps,
    this.dateTime,
  });
}
