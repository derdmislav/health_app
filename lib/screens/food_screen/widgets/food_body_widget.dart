import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:health_app/constants.dart';

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
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10),
                  height: size.width * 0.15,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  //
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

                //BACKEND food nutritive values needed
                Column(
                  children: <Widget>[
                    ExpansionTile(
                      leading: SvgPicture.asset(
                        'assets/icons/bx-dish',
                        color: Colors.black87,
                        height: size.width * 0.10,
                      ),
                      title: Text('FRIDAY'),
                      subtitle: Text('5 items'),
                      trailing: Text('1800 kcal'),
                      children: <Widget>[
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/bx-dish',
                            color: Colors.black87,
                            height: size.width * 0.08,
                          ),
                          title: Text('Pizza slice'),
                          trailing: Text('350 kcal'),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/bx-dish',
                            color: Colors.black87,
                            height: size.width * 0.08,
                          ),
                          title: Text('Eggs Benedict'),
                          trailing: Text('300 kcal'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      leading: SvgPicture.asset(
                        'assets/icons/bx-dish',
                        color: Colors.black87,
                        height: size.width * 0.10,
                      ),
                      title: Text('THURSDAY'),
                      subtitle: Text('0 items'),
                      trailing: Text('0 kcal'),
                      children: <Widget>[
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/bx-dish',
                            color: Colors.black87,
                            height: size.width * 0.10,
                          ),
                          title: Text('Pizza slice'),
                          trailing: Text('250 kcal'),
                        ),
                      ],
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
