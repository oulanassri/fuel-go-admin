import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../common_components/side_menu.dart';
import '../constants.dart';
import '../responsive.dart';
import 'components/adding_driver_form.dart';
import 'drivers_management_controller.dart';

class NewDriverScreen extends StatelessWidget {
   NewDriverScreen({Key? key}) : super(key: key);
  DriversManagementController controller=Get.put( DriversManagementController ());

  @override
  Widget build(BuildContext context) {
    controller.getTrucks();

    Get.put(DriversManagementController()).getTrucks();
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
                child: AddingDriverForm(controller: controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
