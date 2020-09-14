import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_app/models/step_count.dart';
import 'package:health_app/models/step_count_data.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class StepCountTile extends StatelessWidget {
  final dateFormatter = DateFormat('yyyy-MM-dd');
  final dayFormatter = DateFormat('EEEE');
  
  final int tileIndex;

  StepCountTile({this.tileIndex});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<StepCountData>(
      builder: (context, stepCountData, child) {
        StepCount stepCount = stepCountData.getStepCount(tileIndex);

        String formattedDate=dateFormatter.format(stepCount.dateTime);
        String day = dayFormatter.format(stepCount.dateTime).toUpperCase();
        return ListTile(
          dense: true,
          leading: SvgPicture.asset(
            'assets/icons/bx-walk',
            color: Colors.black87,
            height: size.width * 0.10,
          ),
          title: Text('$day ($formattedDate)'),
          subtitle: Text(stepCount.steps.toString()),
          trailing: Text('${(stepCount.steps * 0.04).toString()} kcal'),
        );
      },
    );
  }
}
