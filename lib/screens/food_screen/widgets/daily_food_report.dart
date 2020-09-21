import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_app/constants.dart';
import 'package:health_app/models/food.dart';
import 'package:health_app/models/food_data.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DailyFoodReport extends StatelessWidget {
  final dateFormatter = DateFormat('dd-MM-yyyy');
  final dayFormatter = DateFormat('EEEE');

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int length = Provider.of<FoodData>(context).foodListLength;

    //STAOOOOO
    List<Food> dailyFood = [];
    print('test');
    return Consumer<FoodData>(
      builder: (context, foodData, child) {
        for (int index = 0; index < length; index++) {
          Food food = foodData.getFoodAtIndex(index);
          String date = dateFormatter.format(food.dateTime);

          if (date == dateFormatter.format(DateTime.now())) {
            dailyFood.add(food);
          }
        }

        Food food;

        for (int index = 0; index < dailyFood.length; index++) {
          food.calcium = (double.parse(food.calcium) +
                  double.parse(dailyFood[index].calcium))
              .toString();
              print(food.calcium);
          food.carbohydrate = (double.parse(food.carbohydrate) +
                  double.parse(dailyFood[index].carbohydrate))
              .toString();
          food.cholesterol = (double.parse(food.cholesterol) +
                  double.parse(dailyFood[index].cholesterol))
              .toString();
          food.energy = (double.parse(food.energy) +
                  double.parse(dailyFood[index].energy))
              .toString();
          food.fattyAcidsSat = (double.parse(food.fattyAcidsSat) +
                  double.parse(dailyFood[index].fattyAcidsSat))
              .toString();
          food.fattyAcidsTrans = (double.parse(food.fattyAcidsTrans) +
                  double.parse(dailyFood[index].fattyAcidsTrans))
              .toString();
          food.fiber =
              (double.parse(food.fiber) + double.parse(dailyFood[index].fiber))
                  .toString();
          food.iron =
              (double.parse(food.iron) + double.parse(dailyFood[index].iron))
                  .toString();
          food.protein = (double.parse(food.protein) +
                  double.parse(dailyFood[index].protein))
              .toString();
          food.sodium = (double.parse(food.sodium) +
                  double.parse(dailyFood[index].sodium))
              .toString();
          food.sugarsTotal = (double.parse(food.sugarsTotal) +
                  double.parse(dailyFood[index].sugarsTotal))
              .toString();
          food.totalLipid = (double.parse(food.totalLipid) +
                  double.parse(dailyFood[index].totalLipid))
              .toString();
          food.vitaminA = (double.parse(food.vitaminA) +
                  double.parse(dailyFood[index].vitaminA))
              .toString();
          food.vitaminC = (double.parse(food.vitaminC) +
                  double.parse(dailyFood[index].vitaminC))
              .toString();
          food.vitaminD = (double.parse(food.vitaminD) +
                  double.parse(dailyFood[index].vitaminD))
              .toString();
        }

        return _nutritionDialog(context, food) as Widget;
      },
    );
  }
}

void _nutritionDialog(BuildContext context, Food food) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('${food.description}'),
          Divider(
            color: Theme.of(context).accentColor,
            thickness: 1,
          ),
          Text('Količina u 100 g'),
          Divider(),
          Text('Kalorije(kcal) ${food.energy}'),
          Divider(),
          Text('Masti: ${food.totalLipid} g'),
          Text('Zasicene ${food.fattyAcidsSat} g'),
          Text('Nezasicene ${food.fattyAcidsTrans} g'),
          Divider(),
          Text('Kolesterol ${food.cholesterol} mg'),
          Text('Natrij ${food.sodium} mg'),
          Divider(),
          Text('Ugljikohidrati ${food.carbohydrate} g'),
          Text('Od toga šećeri: ${food.sugarsTotal} g'),
          Text('Od toga dijetna vlakna: ${food.fiber} g'),
          Divider(),
          Text('Bjelančevine ${food.protein} g'),
          Divider(),
          Text('Kalcij ${food.calcium} mg'),
          Text('Željezo ${food.iron} mg'),
          Text('Vitamin A ${food.vitaminA} IU'),
          Text('Vitamin C ${food.vitaminC} mg'),
          Text('Vitamin D ${food.vitaminD} IU'),
          Divider(color: Theme.of(context).accentColor),
        ],
      ),
      actions: [
        FlatButton(
          child: Row(
            children: [
              Text('Return'),
              Icon(
                Icons.arrow_back,
                size: 34,
                color: Colors.redAccent,
              ),
            ],
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
