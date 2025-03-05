import 'package:admin_fuel_go/screens/shifts_management/shefts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../common_components/custom_material_button.dart';
import '../common_components/side_menu.dart';
import '../constants.dart';
import '../responsive.dart';
import 'components/custom_shifts_table.dart';

class ShiftsScreen extends GetView<ShiftsController> {
  const ShiftsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ShiftsController());
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                child:
                    CustomShiftsTable(controller: controller,), //CustomOrdersTable()// OrderDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
