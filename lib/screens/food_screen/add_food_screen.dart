import 'package:flutter/material.dart';
import 'package:health_app/models/food.dart';
import 'package:health_app/resources/health_app_api.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_app/models/food_data.dart';

class AddFoodScreen extends StatefulWidget {
  @override
  _AddFoodScreenState createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  String ingredient;
  List<Food> foods = [];
  bool isLoading = false;
  final TextEditingController controller = TextEditingController();

  void _addContact(context) async {
    /// Validate the ingredient name input
    if (ingredient == null || ingredient.length < 3) {
      Fluttertoast.showToast(
        msg: 'You need to type at least 3 letters',
        backgroundColor: Theme.of(context).accentColor,
      );
      return;
    } else {
      setState(() {
        isLoading = true;
      });
      List<Food> result = await HealthAppApi().searchFood(ingredient);
      setState(() {
        isLoading = false;
        foods = result;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Choose food'),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Search',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              _addContact(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                //ADDED CONTROLLER FOR DONE BUTTON
                //added dispose for controller
                onEditingComplete: () {
                  setState(() {
                    ingredient = controller.text;
                    _addContact(context);
                    FocusScope.of(context).unfocus();
                  });
                },
                onChanged: (nameIngredient) {
                  setState(() {
                    ingredient = nameIngredient;
                  });
                },
              ),
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        itemCount: foods.length,
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.black54,
                        ),
                        itemBuilder: (context, index) {
                          return ListTile(
                            onLongPress: () {
                              _addFood(context, foods[index]);
                              Navigator.pop(context);
                            },
                            onTap: () {
                              _nutritionDialog(context, foods[index]);
                            },
                            leading: IconButton(
                              icon: Icon(
                                Icons.playlist_add,
                                color: Theme.of(context).accentColor,
                              ),
                              onPressed: null,
                            ),
                            title: Text(foods[index].description.toString()),
                            subtitle: Text(foods[index].dataType),
                            trailing: Text('${foods[index].energy} kcal'),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void _addFood(context, Food food) {
  /// Save food, and its nutrients
  ///
  food.dateTime = DateTime.now();
  Provider.of<FoodData>(context, listen: false).addFood(food);
  Fluttertoast.showToast(
    msg: 'Food added to your list.',
    backgroundColor: Theme.of(context).accentColor,
  );
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
          Text('Sodium ${food.sodium} mg'),
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
        TextButton(
          child: Row(
            children: [
              Text('Add'),
              Icon(
                Icons.add,
                size: 34,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
          onPressed: () {
            _addFood(context, food);
            Navigator.of(context).pushNamed('/FoodScreen');
          },
        ),
      ],
    ),
  );
}
