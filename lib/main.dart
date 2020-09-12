import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:health_app/models/step_count.dart';
import 'package:health_app/models/step_count_data.dart';
import 'package:health_app/screens/food_screen/add_food_screen.dart';
import 'package:health_app/screens/overview/overview_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

import 'constants.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // HIVE INITIALIZATION

  //localNotifications
  var initializationSettingsAndroid = AndroidInitializationSettings('drugs');

  var initializationSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
    onDidReceiveLocalNotification:
        (int id, String title, String body, String payload) async {},
  );
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification payload: ' + payload);
      }
    },
  );

  Hive.registerAdapter(StepCountAdapter());

  runApp(MyApp());
}

Future _initHive() async {
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StepCountData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HealthApp',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor: kAccentColor,
          fontFamily: 'OpenSans',
          textTheme: Theme.of(context).textTheme,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => FutureBuilder(
                future: _initHive(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.error != null) {
                      print(snapshot.error);
                      return Scaffold(
                        body: Center(
                          child: Text('Error initializing hive data store.'),
                        ),
                      );
                    } else {
                      return OverviewScreen();
                    }
                  } else {
                    return Scaffold();
                  }
                },
              ),
          '/AddFoodScreen': (context) => AddFoodScreen(),
        },
      ),
    );
  }
}
