import 'package:flutter/material.dart';

import 'package:health_app/constants.dart';
import 'package:health_app/screens/med_screen/widgets/med_body_widget.dart';

class MedScreen extends StatefulWidget {
  @override
  _MedScreenState createState() => _MedScreenState();
}

class _MedScreenState extends State<MedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: _buildAppBar(context),
      body: MedBodyWidget(),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
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
      'Medicine screen',
      style: TextStyle(
        color: Colors.black87,
      ),
    ),
    actions: <Widget>[
      IconButton(
        padding: EdgeInsets.only(right: 30),
        icon: Icon(
          Icons.add,
          color: Colors.black87,
          size: 35,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/AddMedicineScreen');
        },
      ),
    ],
  );
}
