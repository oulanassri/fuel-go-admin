import 'package:admin_fuel_go/screens/orders/components/row_details.dart';
import 'package:flutter/material.dart';

import '../../../models/trucks.dart';
import '../../constants.dart';
class CustomLorryDetails extends StatelessWidget {
   CustomLorryDetails({Key? key,required this.trucksModel}) : super(key: key);
 final TrucksModel trucksModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
mainAxisAlignment: MainAxisAlignment.center,
        children: [


          RowDetails(
            title: 'رقم اللّوحة',
            label: trucksModel.plateNumber.toString()??"",
          ),
          RowDetails(
            title: ' نوع وقود خزان الشاحنة الخارجي',
            label:trucksModel.cargoTankTypeName.toString()??"",
          ),
          RowDetails(
            title: 'كمية الوقود بخزان الشاحنة الخارجي',
            label: trucksModel.cargoTankCapacity.toString()??"",
          ),
          RowDetails(
            title: 'نوع وقود خزان الشاحنة',
            label: trucksModel.fuelTankTypeName.toString()??"",
          ),
          RowDetails(
            title: 'كمية وقود خزان الشاحنة',
            label: trucksModel.fuelTankCapacity.toString()??"",
          ),
        ],
      ),
    );
  }
}
