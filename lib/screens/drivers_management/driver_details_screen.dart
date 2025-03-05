import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../common_components/side_menu.dart';
import '../constants.dart';
import '../responsive.dart';
import 'components/driver_details.dart';
import 'drivers_management_controller.dart';
class DriverDetailsScreen extends GetView<DriversManagementController> {
  const DriverDetailsScreen({Key? key}) : super(key: key);

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
                  controller: controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
