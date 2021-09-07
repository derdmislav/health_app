import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:health_app/models/food.dart';
import 'package:health_app/models/food_data.dart';
import 'package:intl/intl.dart';

class FoodTile extends StatefulWidget {
  final int tileIndex;

  FoodTile({this.tileIndex});

  @override
  _FoodTileState createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  final dateFormatter = DateFormat('dd-MM-yyyy');

  final dayFormatter = DateFormat('EEEE');

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<FoodData>(
      builder: (context, foodData, child) {
        Food food = foodData.getFoodAtIndex(widget.tileIndex);
        String date = dateFormatter.format(food.dateTime);
        return ListTile(
          leading: SvgPicture.asset(
            'assets/icons/bx-dish',
            color: Colors.black87,
            height: size.width * 0.08,
          ),
          title: Text('${food.description}'),
          subtitle: Text('$date'),
          trailing: Text('${food.energy} kcal'),
          onTap: () {
            _nutritionDialog(context, food);
          },
        );
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
          Text('Amount in 100 g'),
          Divider(),
          Text('Calories(kcal): ${food.energy}'),
          Divider(),
          Text('Total lipids: ${food.totalLipid} g'),
          Text('Saturated fatty acids: ${food.fattyAcidsSat} g'),
          Text('Unsaturated fatty acids ${food.fattyAcidsTrans} g'),
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
              Text('Back'),
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
