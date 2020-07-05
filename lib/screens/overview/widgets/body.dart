import 'package:flutter/material.dart';
import 'package:health_app/constants.dart';
import 'package:health_app/screens/med_screen/med_screen.dart';
import 'package:health_app/screens/overview/widgets/med_card.dart';

import 'package:health_app/screens/pedometer_screen/pedometer_screen.dart';
import 'package:health_app/screens/overview/widgets/steps_card.dart';
import 'package:health_app/screens/overview/widgets/food_card.dart';
import 'package:health_app/screens/food_screen/food_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: Icon(
                Icons.notification_important,
                color: kBackgroundColor,
              ),
              title: Text(
                'Nasoryl at 15:45',
                style: TextStyle(color: kBackgroundColor, fontSize: 18,fontFamily: 'OpenSans'),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Stack(
              children: <Widget>[
                //Background
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PedometerScreen()),
                        );
                      },
                      child: StepsCard(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FoodScreen()),
                        );
                      },
                      child: FoodCard(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MedScreen()),
                        );
                      },
                      child: MedCard(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
