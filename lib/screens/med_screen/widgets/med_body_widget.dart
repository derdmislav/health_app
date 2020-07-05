import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:health_app/constants.dart';

class MedBodyWidget extends StatelessWidget {
  const MedBodyWidget({
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

                  // KORACI U DANU
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/icons/capsule-f.svg',
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
                        'assets/svgs/Medicine.svg',
                        height: size.width * 0.5,
                        width: size.width * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),

                //BACKEND medication HISTORY needed
                Column(
                  children: <Widget>[
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/capsule-f.svg',
                        color: Colors.black87,
                        height: size.width * 0.10,
                      ),
                      title: Text('FRIDAY'),
                      subtitle: Text('6000 steps'),
                      trailing: Text('280 kcal'),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/capsule-f.svg',
                        color: Colors.black87,
                        height: size.width * 0.10,
                      ),
                      title: Text('SATURDAY'),
                      subtitle: Text('5500 steps'),
                      trailing: Text('250 kcal'),
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/capsule-f.svg',
                        color: Colors.black87,
                        height: size.width * 0.10,
                      ),
                      title: Text('SUNDAY'),
                      trailing: Icon(
                        Icons.check,
                        color: Colors.green.shade600,
                        size: 33,
                      ),
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
