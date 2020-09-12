import 'package:flutter/material.dart';

class AddMedicineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();

    return AlertDialog(
      title: Text('Medication reminder'),
      content: TextField(
        controller: _textFieldController,
        decoration: InputDecoration(hintText: 'name and dose'),
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
