import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../models/trucks.dart';
import '../common_components/side_menu.dart';
import '../constants.dart';
import '../responsive.dart';
import 'components/lorry_details.dart';
import 'lorries_managment_controller.dart';

class LorryDetailsScreen extends GetView<LorriesManagementController> {
  LorryDetailsScreen({Key? key}) : super(key: key);

  String plateNumber = Get.parameters['plateNumber'].toString();
  String cargoTankTypeName = Get.parameters['cargoTankTypeName'].toString();

  String fuelTankTypeName = Get.parameters['fuelTankTypeName'].toString();

  String cargoTankFullCapacity = Get.parameters['cargoTankFullCapacity'].toString();
  String fuelTankFullCapacity = Get.parameters['fuelTankFullCapacity'].toString();
  String cargoTankCapacity = Get.parameters['cargoTankCapacity'].toString();
  String fuelTankCapacity = Get.parameters['fuelTankCapacity'].toString();

  @override
  Widget build(BuildContext context) {
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
                child: LorryDetails(
                  trucksModel: TrucksModel(

                    plateNumber: plateNumber,
                    cargoTankTypeName: cargoTankTypeName,
                    fuelTankTypeName: fuelTankTypeName,
                    cargoTankFullCapacity: int.parse(cargoTankFullCapacity),
                    fuelTankFullCapacity: int.parse(fuelTankFullCapacity),
                    cargoTankCapacity: int.parse(cargoTankCapacity),
                    fuelTankCapacity: int.parse(fuelTankCapacity),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
