import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:health_app/models/medicine.dart';
import 'package:health_app/models/medicine_data.dart';
import 'package:intl/intl.dart';

class MedicineTile extends StatelessWidget {
  final int tileIndex;

  final dateFormatter = DateFormat('dd-MM-yyyy');
  final dayFormatter = DateFormat('EEEE');

  //CONST
  MedicineTile({this.tileIndex});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<MedicineData>(
      builder: (context, medicineData, child) {
        Food medicine = medicineData.getMedicineAtIndex(tileIndex);

        return ListTile(
          leading: SvgPicture.asset(
            'assets/icons/capsule-f.svg',
            color: Colors.black87,
            height: size.width * 0.10,
          ),
          title: Text(
            '${medicine.medicine} - ${medicine.dose}',
          ),
          subtitle: Text(
            '${medicine.dateTime.hour}:${medicine.dateTime.minute}  ${dayFormatter.format(medicine.dateTime)} ${dateFormatter.format(medicine.dateTime)}',
          ),
          trailing: medicine.dateTime.isBefore(
            DateTime.now(),
          )
              ? Icon(
                  Icons.check,
                  color: Colors.green.shade600,
                  size: 25,
                )
              : Icon(
                  Icons.hourglass_empty,
                  color: Colors.green.shade600,
                  size: 25,
                ),
        );
      },
    );
  }
}
