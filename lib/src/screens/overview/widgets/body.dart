import 'package:flutter/material.dart';

import './item_card.dart';
import '../../pedometer_screen/pedometer_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(),
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
                      child: ItemCard(repo: 'assets/svgs/Walking.svg'),
                    ),
                    ItemCard(repo: 'assets/svgs/Medicine.svg'),
                    ItemCard(repo: 'assets/svgs/Food.svg'),
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
