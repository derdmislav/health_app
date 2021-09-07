import 'package:flutter/material.dart';
import 'package:health_app/constants.dart';
import 'package:health_app/models/medicine.dart';
import 'package:health_app/models/medicine_data.dart';
import 'package:health_app/screens/med_screen/med_screen.dart';
import 'package:health_app/screens/overview/widgets/med_card.dart';

import 'package:health_app/screens/pedometer_screen/pedometer_screen.dart';
import 'package:health_app/screens/overview/widgets/steps_card.dart';
import 'package:health_app/screens/overview/widgets/food_card.dart';
import 'package:health_app/screens/food_screen/food_screen.dart';
import 'package:provider/provider.dart';

class OverviewBodyScreen extends StatefulWidget {
  @override
  _OverviewBodyScreenState createState() => _OverviewBodyScreenState();
}

class _OverviewBodyScreenState extends State<OverviewBodyScreen> {
  String _medicine;

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
            child: FutureBuilder<String>(
              future: showScheduledMedicine(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return ListTile(
                  leading: Icon(
                    Icons.notification_important,
                    color: kBackgroundColor,
                  ),
                  title: Text(
                    _medicine ?? 'No scheduled prescription',
                    style: TextStyle(color: kBackgroundColor, fontSize: 18, fontFamily: 'OpenSans'),
                  ),
                );
              },
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
                          MaterialPageRoute(builder: (context) => PedometerScreen()),
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

  Future<String> showScheduledMedicine() async {
    List<Food> _medicineList = await Provider.of<MedicineData>(context, listen: false).getNextMedicineInfoIfScheduled();

    DateTime dateNow = DateTime.now();
    if (_medicineList.isEmpty)
      return 'No scheduled prescription';
    else {
      _medicine = 'No scheduled prescription';

      Food incomingMedicine = _medicineList.firstWhere(
        (element) => element.dateTime.isAfter(dateNow),
        orElse: () => Food(medicine: _medicine, dateTime: DateTime.now()),
      );

      _medicine = _medicineStringBuilder(incomingMedicine);
      return _medicine;
    }
  }

  String _medicineStringBuilder(Food medicine) {
    return medicine.medicine == 'No scheduled prescription'
        ? "No scheduled prescription"
        : " ${medicine.dose ?? '1'} of ${medicine.medicine} at ${medicine.dateTime.hour ?? ''}:${medicine.dateTime.minute} on ${medicine.dateTime.day ?? ''}/${medicine.dateTime.month}";
  }
}
