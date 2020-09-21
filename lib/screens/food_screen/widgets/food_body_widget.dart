import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:health_app/constants.dart';
import 'package:health_app/models/food.dart';
import 'package:health_app/models/food_data.dart';
import 'package:health_app/screens/food_screen/widgets/daily_food_report.dart';
import 'package:health_app/screens/food_screen/widgets/food_tile.dart';
import 'package:health_app/screens/food_screen/widgets/splash_effect.dart';
import 'package:provider/provider.dart';

class FoodBodyWidget extends StatelessWidget {
  const FoodBodyWidget({
    Key key,
  }) : super(key: key);

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
                SplashEffect(
                  child: _widget(context),
                  onTap: () {
                    return DailyFoodReport();
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
                      Icon(Icons.touch_app,),
                      Text('Interactive'),
                      Icon(Icons.fastfood),
                    ],
                  ),
                ),

                //BACKEND food nutritive values needed
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
}

Widget _widget(context) {
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
