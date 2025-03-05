import 'package:admin_fuel_go/screens/shifts_management/shefts_controller.dart';
import 'package:flutter/material.dart';
import 'package:admin_fuel_go/screens/shifts_management/components/add_button.dart';

import '../../../models/shift.dart';
import '../../../routes/app_routes.dart';
import '../../common_components/custom_material_button.dart';
import '../../common_components/header.dart';
import '../../constants.dart';

class CustomShiftsTable extends StatelessWidget {
   CustomShiftsTable({
    super.key,
    required this.controller
  });
  ShiftsController controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
          /*  SizedBox(
              height: defaultPadding,
            ), Text(controller.time.toString() ?? ""),*/
            SizedBox(
              height: defaultPadding,
            ),
           /* AddButton(),
            SizedBox(
              height: defaultPadding,
            ),
            CustomMaterialButton(
              route: '',
              text: 'اختر عدد ساعات الدوام',
              function: () {
                controller.pickTime(context);
              },
            ),*/
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: defaultPadding,
                    children: [
                      Header(
                        title: ' برامج الدوام',
                      ),

                      SizedBox(
                        height: defaultPadding,
                      ),
                      // AddButton(),
                      Container(
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
                                      "رقم المناوبة",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "موعد بدء الدوام",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "موعد نهاية الدوام",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "مجموع ساعات الدّوام",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                ],
                                rows: List.generate(
                                  shiftsList.length,
                                  (index) =>
                                      shiftDataRow(shiftsList[index], context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      // CustomLorriesTable(),
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

  DataRow shiftDataRow(ShiftModel shiftModel, BuildContext context) {
    return DataRow(

      cells: [
        DataCell(
          Text(
      shiftModel.id ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
          shiftModel.start ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
        shiftModel.end ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
        shiftModel.total ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
