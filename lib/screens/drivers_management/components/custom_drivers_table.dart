import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/driver_model.dart';
import '../../../models/drivers.dart';
import '../../../models/recent_file.dart';
import '../../../routes/app_routes.dart';
import '../../constants.dart';
import '../driver_details_screen.dart';
import '../drivers_management_controller.dart';

class CustomDriversTable extends StatelessWidget {
  DriversManagementController controller;
   CustomDriversTable({
    super.key,required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isUploading.value
        ? Container(height: double.infinity,
      decoration: BoxDecoration(
        gradient: gradientColorBg,
      ),
      //   height: double.infinity,
      child: Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      ),
    )
        : Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label: Text(
                    "اسم السّائق",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "رقم الهاتف",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DataColumn(
                  label: Text("البريد الإلكتروني",
                    style: Theme.of(context).textTheme.titleLarge,),
                ),

              ],
              rows: List.generate(
                controller.drivers.length,
                (index) => driverDataRow(controller.drivers[index],context),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  DataRow driverDataRow(DriversModel driverModel,BuildContext context) {
    return DataRow(
      onLongPress: (){
        Get.toNamed(Routes.DRIVER_DETAILS);
      },
      cells: [
        DataCell(
          Text(driverModel.name ?? "",
            style:Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(driverModel.phone ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(driverModel.email ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),

      ],
    );
  }
}
