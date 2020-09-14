import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddMedicineScreen extends StatefulWidget {
  @override
  _AddMedicineScreenState createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Medication'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Remind',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              print('pressed');
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: controller,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Medication name',
                  ),
                  //ADDED CONTROLLER FOR DONE BUTTON
                  //added dispose for controller
                  onEditingComplete: () {
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: controller,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Dose',
                  ),
                  //ADDED CONTROLLER FOR DONE BUTTON
                  //added dispose for controller
                  onEditingComplete: () {
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ButtonTheme(
                  minWidth: 150,
                  height: 50,
                  child: RaisedButton(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(
                        color: Theme.of(context).primaryColorLight,
                        width: 2,
                      ),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: null,
                        onChanged: (date) {
                          print('change $date');
                        },
                        onConfirm: (date) {
                          print('confirm $date');
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.en,
                      );
                    },
                    child: Text(
                      'Date & Time',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
