import 'package:flutter/material.dart';

import 'src/screens/overview/overview_screen.dart';
import './src/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealthApp',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        fontFamily: 'OpenSans',
        textTheme: Theme.of(context).textTheme,
      ),
      home: OverviewScreen(),
    );
  }
}
