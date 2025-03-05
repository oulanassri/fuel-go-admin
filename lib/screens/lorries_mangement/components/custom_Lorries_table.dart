import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/lorry_model.dart';
import '../../../routes/app_routes.dart';
import '../../constants.dart';

class CustomLorriesTable extends StatelessWidget {
  const CustomLorriesTable({
    super.key,
  });

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
                    "رقم الشّاحنة",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "نوع الوقود",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
              rows: List.generate(
                lorriesList.length,
                (index) => centerDataRow(lorriesList[index], context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow centerDataRow(LorryModel centerModel, BuildContext context) {
    return DataRow(
      onLongPress: (){
        print("LORRY_DETAILS_SCREEN");
        Get.toNamed(Routes.LORRY_DETAILS_SCREEN);
      },
      cells: [
        DataCell(
          Text(
            centerModel.id ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            centerModel.plateNumber ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
