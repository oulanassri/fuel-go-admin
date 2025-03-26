import 'package:admin_fuel_go/models/driver_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../models/drivers.dart';
import '../common_components/side_menu.dart';
import '../constants.dart';
import '../responsive.dart';
import 'components/driver_details.dart';
import 'drivers_management_controller.dart';
class DriverDetailsScreen extends GetView<DriversManagementController> {
   DriverDetailsScreen({Key? key}) : super(key: key);
  String name = Get.parameters['name'].toString();
  String phone = Get.parameters['phone'].toString();

  String email = Get.parameters['email'].toString();

  String isDriving = Get.parameters['isDriving'].toString();


   @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(backgroundColor: Colors.transparent,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 5,
                child: DriverDetails(
                  driverModel: DriversModel(name:name,phone:phone,email:email,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
