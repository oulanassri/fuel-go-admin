import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../models/drivers.dart';
import '../../constants.dart';
import '../../common_components/header.dart';
import '../../orders/components/custom_driver_details.dart';
import '../drivers_management_controller.dart';
import 'custom_driver_details.dart';

class DriverDetails extends StatelessWidget {
   DriverDetails({Key? key, required this.driverModel})
      : super(key: key);
  final DriversModel driverModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [

            SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Header(
                        title: 'تفاصيل السّائق',
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),

                      FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: CustomDriverDetails1(driversModel: driverModel,)),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: SizedBox())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
