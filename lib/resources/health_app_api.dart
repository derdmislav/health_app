import 'package:health_app/models/food.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HealthAppApi {
  Future<List<Food>> searchFood(String searchQuery) async {
    final url =
        "https://api.nal.usda.gov/fdc/v1/foods/search?query=$searchQuery&pageSize=20&api_key=DEMO_KEY";

    final response = await http.get(url);

    List<Food> list = List<Food>();
    if (response.statusCode == 400 || response.statusCode == 500) {
      throw Exception("Unhandled error");
    } else {
      final parsedJson = json.decode(response.body);
      for (int i = 0; (i < (parsedJson["foods"] as List).length); i++) {
        list.add(Food.fromJson(parsedJson["foods"][i]));
        //
        for (int j = 0;
            (j < (parsedJson["foods"][i]["foodNutrients"] as List).length);
            j++) {
          callSwitch(
            parsedJson["foods"][i]["foodNutrients"][j]["nutrientId"],
            list[i],
            parsedJson["foods"][i]["foodNutrients"][j]["value"],
          );
        }
        //
      }
    }

    return list;
  }

  void callSwitch(int nutrientId, Food food, double value) {
    switch (nutrientId.toString()) {
      case "1003":
        {
          //print('protein');
          food.protein = value.toString();
        }
        break;

      case "1004":
        {
          //print('totalLipid');
          food.totalLipid = value.toString();
        }
        break;

      case "1005":
        {
          //print("Carbohydrate, by difference");
          food.carbohydrate = value.toString();
        }
        break;

      case "1008":
        {
          //print("Energy");
          food.energy = value.toString();
        }
        break;
      case "2000":
        {
          //print("Sugars, total including NLEA");
          food.sugarsTotal = value.toString();
        }
        break;

      case "1079":
        {
          //print("Fiber, total dietary");
          food.fiber=value.toString();
        }
        break;

      case "1087":
        {
          //print("Calcium, Ca");
          food.calcium=value.toString();
        }
        break;

      case "1089":
        {
          //print("Iron, Fe");
          food.iron=value.toString();
        }
        break;
      case "1093":
        {
          //print("Sodium, Na");
          food.sodium=value.toString();
        }
        break;

      case "1110":
        {
          //print("Vitamin D (D2 + D3), International Units");
          food.vitaminD=value.toString();
        }
        break;
      case "1104":
        {
          //print("Vitamin A, IU");
          food.vitaminA=value.toString();
        }
        break;
      case "1253":
        {
          //print("Cholesterol");
          food.cholesterol=value.toString();
        }
        break;

      case "1257":
        {
          //print("Fatty acids, total trans");
          food.fattyAcidsTrans=value.toString();
        }
        break;
      case "1162":
        {
          //print("Vitamin C");
          food.vitaminC=value.toString();
        }
        break;
      case "1258":
        {
          //print("Fatty acids, total saturated");
          food.fattyAcidsSat=value.toString();
        }
        break;

      default:
        {
          print('notfound');
          //throw Exception("Unhandled error");
        }
        break;
    }
  }
}
