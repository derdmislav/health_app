import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:health_app/constants.dart';
import 'package:health_app/models/step_count_data.dart';
import 'package:health_app/screens/pedometer_screen/widgets/step_count_tile_widget.dart';
import 'package:health_app/models/step_count.dart' as STEPCOUNT;
import 'package:pedometer/pedometer.dart';
import 'package:provider/provider.dart';

class PedometerBodyWidget extends StatefulWidget {
  const PedometerBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  _PedometerBodyWidgetState createState() => _PedometerBodyWidgetState();
}

class _PedometerBodyWidgetState extends State<PedometerBodyWidget> {
  Stream<StepCount> _stepCountStream;
  StepCountData _stepCountData;
  bool initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_stepCountData == null)
      _stepCountData = Provider.of<StepCountData>(context);

    if (!initialized) initPlatformState();
  }

  Future<void> initPlatformState() async {
    await _stepCountData.getStepCounts();

    _stepCountStream = Pedometer.stepCountStream;

    initialized = true;

    if (!mounted) return;
  }

  void updateSteps(StepCount data) {
    if (_stepCountData.stepLength == 0) {
      var stepCount = STEPCOUNT.StepCount(
        dateTime: DateTime.now(),
        steps: data.steps,
      );
      _stepCountData.addSteps(stepCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10),
                  height: size.width * 0.15,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  // KORACI U DANU
                  child: StreamBuilder(
                    stream: _stepCountStream,
                    builder: (context, AsyncSnapshot<StepCount> snapshot) {
                      if (snapshot.hasData) {
                        updateSteps(snapshot.data);
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icons/bx-walk',
                            color: Colors.white,
                            height: size.width * 0.10,
                          ),
                          Text(
                            snapshot.hasData && snapshot.data != null
                                ? snapshot.data.steps.toString()
                                : "?",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          Text(
                            '250 kcal',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                //OKVIR I SLIKA
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ),
                  height: size.width * 0.8,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: size.width * 0.7,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/svgs/Walking.svg',
                        height: size.width * 0.6,
                        width: size.width * 0.6,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),

                //BACKEND STEPS HISTORY needed

                Container(
                  height: size.height * 0.35,
                  child: StreamBuilder(
                    stream: _stepCountStream,
                    initialData: null,
                    builder: (context, AsyncSnapshot<StepCount> snapshot) {
                      if (snapshot.hasData && snapshot.data != null)
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return StepCountTile(tileIndex: index);
                          },
                          itemCount: _stepCountData.stepLength,
                        );
                      else
                        return Text("No data :(");
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
