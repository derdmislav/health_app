import 'package:hive/hive.dart';

part 'medicine.g.dart';

@HiveType(typeId: 1)
class Food {
  @HiveField(0)
  DateTime dateTime;
  @HiveField(1)
  String medicine;
  @HiveField(2)
  String dose;

  Food({
    this.dateTime,
    this.medicine,
    this.dose,
  });
}
