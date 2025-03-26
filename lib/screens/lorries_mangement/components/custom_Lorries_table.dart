import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/lorry_model.dart';
import '../../../models/trucks.dart';
import '../../../routes/app_routes.dart';
import '../../constants.dart';
import '../lorries_managment_controller.dart';

class CustomLorriesTable extends StatelessWidget {
  CustomLorriesTable({super.key, required this.controller});

  LorriesManagementController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Obx(() => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    columnSpacing: defaultPadding,
                    columns: [
                      DataColumn(
                        label: Text(
                          "رقم لوحة الشّاحنة",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "نوع وقود الشاحنة",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                    rows: List.generate(
                      controller.trucks.length,
                      (index) =>
                          centerDataRow(controller.trucks[index], context),
                    ),
                  ),
                ),
              ],
            )),
    );
  }

  DataRow centerDataRow(TrucksModel trucksModel, BuildContext context) {
    return DataRow(
      onLongPress: () {
        print("LORRY_DETAILS_SCREEN");

        Get.toNamed(Routes.LORRY_DETAILS_SCREEN,parameters:   {

          "plateNumber":trucksModel.plateNumber??"",
          "cargoTankTypeName":trucksModel.cargoTankTypeName??"",
          "fuelTankTypeName":trucksModel.fuelTankTypeName??"",

          "cargoTankFullCapacity":trucksModel.cargoTankFullCapacity.toString()??"",
          "fuelTankFullCapacity":trucksModel.fuelTankFullCapacity.toString()??"",
          "cargoTankCapacity":trucksModel.cargoTankCapacity.toString()??"",
          "fuelTankCapacity":trucksModel.fuelTankCapacity.toString()??"",

        });
      },
      cells: [
        DataCell(
          Text(
            trucksModel.plateNumber ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            trucksModel.cargoTankTypeName ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
