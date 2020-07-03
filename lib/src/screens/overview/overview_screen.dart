import 'package:flutter/material.dart';

import './widgets/body.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text('Overview'),
      centerTitle: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () {},
        ),
      ],
    );
  }
}
