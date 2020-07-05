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

                  // Report card
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
                    ExpansionTile(
                      leading: SvgPicture.asset(
                        'assets/icons/capsule-f.svg',
                        color: Colors.black87,
                        height: size.width * 0.10,
                      ),
                      title: Text('FRIDAY'),
                      subtitle: Text('2 medication'),
                      trailing: Icon(
                        Icons.check,
                        color: Colors.green.shade600,
                        size: 33,
                      ),
                      children: <Widget>[
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/capsule-f.svg',
                            color: Colors.black87,
                            height: size.width * 0.10,
                          ),
                          title: Text('Loratadine 10mg'),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.green.shade600,
                            size: 25,
                          ),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            'assets/icons/capsule-f.svg',
                            color: Colors.black87,
                            height: size.width * 0.10,
                          ),
                          title: Text('Benadryl 25mg'),
                          trailing: Icon(
                            Icons.check,
                            color: Colors.green.shade600,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        'assets/icons/capsule-f.svg',
                        color: Colors.black87,
                        height: size.width * 0.10,
                      ),
                      title: Text('SUNDAY'),
                      subtitle: Text('0 med'),
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
