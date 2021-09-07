import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:health_app/constants.dart';
import 'package:health_app/models/food.dart';
import 'package:health_app/models/food_data.dart';
import 'package:health_app/screens/food_screen/widgets/food_tile.dart';
import 'package:provider/provider.dart';

class FoodBodyWidget extends StatefulWidget {
  const FoodBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  _FoodBodyWidgetState createState() => _FoodBodyWidgetState();
}

class _FoodBodyWidgetState extends State<FoodBodyWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: _reportCard(context),
                  onTap: () {
                    //return DailyFoodReport();
                    showNutritionDialog(context);
                  },
                ),

                //OKVIR I SLIKA
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ),
                  height: size.width * 0.6,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/svgs/Food.svg',
                        height: size.width * 0.5,
                        width: size.width * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.8,
                  height: size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Interactive'),
                      Icon(Icons.touch_app),
                      Text('Interactive'),
                      Icon(Icons.fastfood),
                    ],
                  ),
                ),

                Container(
                  height: size.height * 0.45,
                  width: size.width * 0.9,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return FoodTile(tileIndex: index);
                    },
                    itemCount: Provider.of<FoodData>(context).foodListLength,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isSameDate(Food element) {
    return element.dateTime.day == DateTime.now().day && element.dateTime.month == DateTime.now().month;
  }

  void showNutritionDialog(context) async {
    List<Food> foodList = await Provider.of<FoodData>(context, listen: false).getFoodList();

    List<Food> dailyFood = foodList.where((element) => isSameDate(element)).toList();

    Food food = Food(description: 'Daily food intake');

    for (int index = 0; index < dailyFood.length; index++) {
      food.calcium = (double.parse(food.calcium ?? '0') + double.parse(dailyFood[index].calcium ?? '0')).toString();
      food.carbohydrate = (double.parse(food.carbohydrate ?? '0') + double.parse(dailyFood[index].carbohydrate ?? '0'))
          .toStringAsFixed(2);
      food.cholesterol =
          (double.parse(food.cholesterol ?? '0') + double.parse(dailyFood[index].cholesterol ?? '0')).toString();
      food.energy = (double.parse(food.energy ?? '0') + double.parse(dailyFood[index].energy ?? '0')).toString();
      food.fattyAcidsSat =
          (double.parse(food.fattyAcidsSat ?? '0') + double.parse(dailyFood[index].fattyAcidsSat ?? '0')).toString();
      food.fattyAcidsTrans =
          (double.parse(food.fattyAcidsTrans ?? '0') + double.parse(dailyFood[index].fattyAcidsTrans ?? '0'))
              .toString();
      food.fiber = (double.parse(food.fiber ?? '0') + double.parse(dailyFood[index].fiber ?? '0')).toString();
      food.iron = (double.parse(food.iron ?? '0') + double.parse(dailyFood[index].iron ?? '0')).toString();
      food.protein = (double.parse(food.protein != null
                  ? food.protein.isEmpty
                      ? '0'
                      : food.protein
                  : '0') +
              double.parse(dailyFood[index].protein ?? '0'))
          .toString();
      food.sodium = (double.parse(food.sodium ?? '0') + double.parse(dailyFood[index].sodium ?? '0')).toString();
      food.sugarsTotal =
          (double.parse(food.sugarsTotal ?? '0') + double.parse(dailyFood[index].sugarsTotal ?? '0')).toString();
      food.totalLipid =
          (double.parse(food.totalLipid ?? '0') + double.parse(dailyFood[index].totalLipid ?? '0')).toStringAsFixed(2);
      food.vitaminA = (double.parse(food.vitaminA ?? '0') + double.parse(dailyFood[index].vitaminA ?? '0')).toString();
      food.vitaminC = (double.parse(food.vitaminC ?? '0') + double.parse(dailyFood[index].vitaminC ?? '0')).toString();
      food.vitaminD = (double.parse(food.vitaminD ?? '0') + double.parse(dailyFood[index].vitaminD ?? '0')).toString();
    }

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
            Text('Amount in 100g'),
            Divider(),
            Text('Calories(kcal): ${food.energy}'),
            Divider(),
            Text('Total lipids: ${food.totalLipid} g'),
            Text('Saturated fatty acids: ${food.fattyAcidsSat} g'),
            Text('Unsaturated fatty acids: ${food.fattyAcidsTrans} g'),
            Divider(),
            Text('Cholesterol: ${food.cholesterol} mg'),
            Text('Sodium: ${food.sodium} mg'),
            Divider(),
            Text('Carbohydrate: ${food.carbohydrate} g'),
            Text('Sugars total: ${food.sugarsTotal} g'),
            Text('Fiber: ${food.fiber} g'),
            Divider(),
            Text('Protein: ${food.protein} g'),
            Divider(),
            Text('Calcium: ${food.calcium} mg'),
            Text('Iron: ${food.iron} mg'),
            Text('Vitamin A ${food.vitaminA} IU'),
            Text('Vitamin C ${food.vitaminC} mg'),
            Text('Vitamin D ${food.vitaminD} IU'),
            Divider(color: Theme.of(context).accentColor),
          ],
        ),
        actions: [
          TextButton(
            child: Row(
              children: [
                Text('Nazad'),
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
}

Widget _reportCard(context) {
  final size = MediaQuery.of(context).size;
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 10),
    height: size.width * 0.15,
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SvgPicture.asset(
          'assets/icons/bx-dish',
          color: Colors.white,
          height: size.width * 0.10,
        ),
        Text(
          'Report',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        Text(
          'More info below',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
