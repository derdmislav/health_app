import 'package:flutter/material.dart';

import 'package:health_app/constants.dart';
import 'package:health_app/models/food_data.dart';
import 'package:health_app/screens/food_screen/widgets/food_body_widget.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: _buildAppBar(context),
      body: FoodBodyWidget(),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  Provider.of<FoodData>(context, listen: false).getFoodList();
  return AppBar(
    backgroundColor: kBackgroundColor,
    elevation: 0,
    leading: IconButton(
      padding: EdgeInsets.only(left: 10),
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black87,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(
      'Food screen',
      style: TextStyle(color: Colors.black87),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.fastfood,
          color: Colors.black87,
          size: 32,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/AddFoodScreen');
        },
      ),
    ],
  );
}
