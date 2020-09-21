import 'package:hive/hive.dart';

part 'food.g.dart';

@HiveType(typeId: 2)
class Food {
  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  int id;

  @HiveField(2)
  String description;

  //nutrients below
  @HiveField(3)
  String carbohydrate = '0';

  @HiveField(4)
  String dataType;

  @HiveField(5)
  String protein = '';

  @HiveField(6)
  String totalLipid = '0';

  @HiveField(7)
  String energy = '0';

  @HiveField(8)
  String vitaminA = '0';

  @HiveField(9)
  String vitaminD = '0';

  @HiveField(10)
  String calcium = '0';

  @HiveField(11)
  String iron = '0';

  @HiveField(12)
  String vitaminC = '0';

  @HiveField(13)
  String sugarsTotal = '0';

  @HiveField(14)
  String fiber = '0';

  @HiveField(15)
  String sodium = '0';

  @HiveField(16)
  String cholesterol = '0';

  @HiveField(17)
  String fattyAcidsTrans = '0';

  @HiveField(18)
  String fattyAcidsSat = '0';

  Food({this.id, this.description, this.dataType, this.energy});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json["fdcId"],
      description: json["description"],
      dataType: json["dataType"],
    );
  }
}
