import 'package:flutter/material.dart';

import './widgets/body.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: buildAppBar(),
      body: OverviewBodyScreen(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text('Overview'),
      centerTitle: false,
    );
  }
}
