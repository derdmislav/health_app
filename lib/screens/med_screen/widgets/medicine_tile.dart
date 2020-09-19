import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:health_app/models/medicine.dart';
import 'package:health_app/models/medicine_data.dart';

class MedicineTile extends StatelessWidget {
  final int tileIndex;

  //CONST
  MedicineTile({this.tileIndex});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<MedicineData>(
      builder: (context, medicineData, child) {
        Medicine medicine = medicineData.getMedicineAtIndex(tileIndex);

        return ListTile(
          leading: SvgPicture.asset(
            'assets/icons/capsule-f.svg',
            color: Colors.black87,
            height: size.width * 0.10,
          ),
          title: Text(medicine.medicine),
          subtitle: Text(medicine.dose),
          trailing: Icon(
            Icons.check,
            color: Colors.green.shade600,
            size: 25,
          ),
        );
      },
    );
  }
}
