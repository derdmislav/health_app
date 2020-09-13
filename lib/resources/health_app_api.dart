import 'package:health_app/models/food.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HealthAppApi {
  Future<List<Food>> searchFood(String searchQuery) async {
    final url =
        "https://api.nal.usda.gov/fdc/v1/foods/search?query=$searchQuery&api_key=DEMO_KEY";

    final response = await http.get(url);

    List<Food> list = List<Food>();
    if (response.statusCode == 400 || response.statusCode == 500) {
      throw Exception("Unhadled error");
    } else {
      final parsedJson = json.decode(response.body);
      for (int i = 0; (i < (parsedJson["foods"] as List).length); i++) {
        list.add(Food.fromJson(parsedJson["foods"][i]));
      }
    }

    return list;
  }
}
