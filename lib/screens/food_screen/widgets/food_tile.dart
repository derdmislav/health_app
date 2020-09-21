import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:health_app/models/food.dart';
import 'package:health_app/models/food_data.dart';
import 'package:intl/intl.dart';

class FoodTile extends StatelessWidget {
  final int tileIndex;

  final dateFormatter = DateFormat('dd-MM-yyyy');
  final dayFormatter = DateFormat('EEEE');

  //CONST
  FoodTile({this.tileIndex});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<FoodData>(
      builder: (context, foodData, child) {
        Food food = foodData.getFoodAtIndex(tileIndex);
        String date = dateFormatter.format(food.dateTime);
        return ListTile(
          leading: SvgPicture.asset(
            'assets/icons/bx-dish',
            color: Colors.black87,
            height: size.width * 0.08,
          ),
          title: Text(
            '${food.description}',
          ),
          subtitle: Text(
            '$date',
          ),
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
