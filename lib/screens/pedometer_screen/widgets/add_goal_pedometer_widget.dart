import 'package:flutter/material.dart';

class AddGoalPedometerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();

    return AlertDialog(
      title: Text('Daily steps goal'),
      content: TextField(
        keyboardType: TextInputType.number,
        controller: _textFieldController,
        decoration: InputDecoration(hintText: 'New daily steps goal'),
      ),
      actions: [
        FlatButton(
          onPressed: () {},
          child: Text('CANCEL'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Text('UPDATE'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
