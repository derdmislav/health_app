import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_app/models/step_count.dart';
import 'package:health_app/models/step_count_data.dart';
import 'package:provider/provider.dart';

class StepCountTile extends StatelessWidget {
  final int tileIndex;

  StepCountTile({this.tileIndex});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<StepCountData>(
      builder: (context, stepCountData, child) {
        StepCount stepCount = stepCountData.getStepCount(tileIndex);
        print(stepCount.steps);
        return ListTile(
          leading: SvgPicture.asset(
            'assets/icons/bx-walk',
            color: Colors.black87,
            height: size.width * 0.10,
          ),
          title: Text(stepCount.dateTime.toString()),
          subtitle: Text(stepCount.steps.toString()),
          trailing: Text('${(stepCount.steps * 0.04).toString()} kcal'),
        );
      },
    );
  }
}
