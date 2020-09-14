import 'package:hive/hive.dart';

//@HiveType(typeId: 1)
class Food {
  //@HiveField(0)
  int id;
  //@HiveField(1)
  String description;
  //nutrients below
  //@HiveField(2)
  String carbohydrate;

  String dataType;

  String protein;

  String totalLipid;

  String energy;

  String vitaminA;

  String vitaminD;

  String calcium;

  String iron;

  String vitaminC;

  String sugarsTotal;

  String fiber;

  String sodium;

  String cholesterol;

  String fattyAcidsTrans;

  String fattyAcidsSat;

  Food({this.id, this.description, this.dataType, this.energy});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json["fdcId"],
      description: json["description"],
      dataType: json["dataType"],
    );
  }
}
