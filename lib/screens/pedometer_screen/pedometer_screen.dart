import 'package:flutter/material.dart';
import 'package:health_app/constants.dart';
import 'package:health_app/screens/pedometer_screen/widgets/pedometer_body_widget.dart';

class PedometerScreen extends StatefulWidget {
  @override
  _PedometerScreenState createState() => _PedometerScreenState();
}

class _PedometerScreenState extends State<PedometerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: _buildAppBar(context),
      body: PedometerBodyWidget(),
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
      'Pedometer screen',
      style: TextStyle(color: Colors.black87),
    ),
  );
}
