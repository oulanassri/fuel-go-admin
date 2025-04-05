import 'package:admin_fuel_go/screens/lorries_mangement/components/lorries_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../common_components/side_menu.dart';
import '../constants.dart';
import '../responsive.dart';
import 'lorries_managment_controller.dart';

class LorriesManagementScreen extends GetView<LorriesManagementController> {
  const LorriesManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LorriesManagementController());
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context)||Responsive.isTablet(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 5,
                child: LorriesTable(controller: controller,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
