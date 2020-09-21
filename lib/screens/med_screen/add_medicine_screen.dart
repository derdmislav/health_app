import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:health_app/models/medicine.dart';
import 'package:health_app/models/medicine_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:health_app/main.dart';

class AddMedicineScreen extends StatefulWidget {
  @override
  _AddMedicineScreenState createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerDose = TextEditingController();
  String medicationName;
  String medicationDose = '';
  DateTime dateTimeMed;

  void _addMedicine(context) {
    /// Validate the name and datetime input
    if (medicationName == null) {
      Fluttertoast.showToast(
        msg: 'You must include a name.',
        backgroundColor: Theme.of(context).accentColor,
      );
      return;
    }
    if (dateTimeMed == null) {
      Fluttertoast.showToast(
        msg: 'You must input date.',
        backgroundColor: Theme.of(context).accentColor,
      );
      return;
    }

    /// Save medicine, dose and datetime
    Provider.of<MedicineData>(context, listen: false).addMedicine(
      Food(
        medicine: medicationName,
        dose: (medicationDose != null) ? medicationDose : '',
        dateTime: dateTimeMed,
      ),
    );
    Fluttertoast.showToast(
      msg: 'Medicine added.',
      backgroundColor: Theme.of(context).accentColor,
    );
    _scheduleNotification();
    Navigator.pop(context);
  }

  Future<void> _scheduleNotification() async {
    var scheduledNotificationDateTime = dateTimeMed;
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your other channel id',
        'your other channel name',
        'your other channel description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        '$medicationName - $medicationDose',
        'You have scheduled notification for taking the $medicationName',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerDose.dispose();
    super.dispose();
  }

  bool isNull() {
    return dateTimeMed == null;
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
              /// Validate the client name input
              _addMedicine(context);
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
                  controller: controllerName,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Medication name',
                  ),
                  onChanged: (value) {
                    medicationName = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: controllerDose,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Dose',
                  ),
                  onChanged: (value) {
                    medicationDose = value;
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
                      DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: null,
                        onConfirm: (date) {
                          setState(() {
                            dateTimeMed = date;
                          });
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
              SizedBox(
                height: 10,
              ),
              isNull()
                  ? Text(
                      'No date picked',
                      style: TextStyle(fontSize: 18),
                    )
                  : Text(
                      dateTimeMed.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
