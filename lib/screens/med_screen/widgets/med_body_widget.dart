import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:health_app/constants.dart';

import 'package:health_app/models/medicine_data.dart';
import 'package:health_app/screens/med_screen/widgets/medicine_tile.dart';
import 'package:provider/provider.dart';

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

                // med history
                Container(
                  height: size.height * 0.45,
                  width: size.width * 0.9,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MedicineTile(tileIndex: index);
                    },
                    itemCount: Provider.of<MedicineData>(context).medicineListLength,
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
