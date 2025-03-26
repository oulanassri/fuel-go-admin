import 'package:admin_fuel_go/screens/orders/components/row_details.dart';
import 'package:flutter/material.dart';

import '../../../models/drivers.dart';
import '../../../models/trucks.dart';
import '../../constants.dart';
class CustomDriverDetails1 extends StatelessWidget {
  CustomDriverDetails1({Key? key,required this.driversModel}) : super(key: key);
 final DriversModel driversModel;
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
            title: 'اسم السّائق',
            label: driversModel.name.toString()??"",
          ),
          RowDetails(
            title: 'رقم الهاتف',
            label:driversModel.phone.toString()??"",
          ),
          RowDetails(
            title: 'البريد الإلكتروني',
            label: driversModel.email.toString()??"",
          ),


        ],
      ),
    );
  }
}
