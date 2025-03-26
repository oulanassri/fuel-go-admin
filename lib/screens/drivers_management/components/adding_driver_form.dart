import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants.dart';
import '../../common_components/header.dart';
import '../../common_components/custom_material_button.dart';
import '../../common_components/custom_text_form_field.dart';
import '../../responsive.dart';
import '../drivers_management_controller.dart';
import 'add_button1.dart';

class AddingDriverForm extends StatelessWidget {
   AddingDriverForm({Key? key, })
      : super(key: key);
  DriversManagementController controller=Get.put( DriversManagementController ());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Header(
                        title: 'إضافة سائق',
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding * 3),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                CustomTextFormField(
                                  hintText: "اسم السائق",
                                  controller: controller.nameController,
                                ),
                                CustomTextFormField(
                                  hintText: "البريد الإلكتروني",
                                  controller: controller.emailController,
                                ),
                                CustomTextFormField(
                                  hintText: "رقم الهاتف",
                                  controller: controller.phoneController,
                                ),

                                Obx(
                                  () => Padding(
                                      padding: const EdgeInsets.all(
                                          defaultPadding / 2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "اختر برنامج الدّوام",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          DropdownButton<String>(
                                              // updated
                                              onChanged: (String? newValue) {
                                                controller.setSelectedSift(
                                                    newValue ?? '');
                                              },
                                              value: controller.selectedShift
                                                  .value, //updated
                                              items: [
                                                for (var value
                                                    in controller.shifts)
                                                  DropdownMenuItem(
                                                    value: value.shiftName,
                                                    child: Text(
                                                      value.shiftName
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge, //updated
                                                    ),
                                                  ),
                                              ]),
                                        ],
                                      )),
                                ),
                                Obx(
                                  () => Padding(
                                      padding: const EdgeInsets.all(
                                          defaultPadding / 2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "اختر رقم لوحة الشّاحنة",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          DropdownButton<String>(
                                              // updated
                                              onChanged: (String? newValue) {
                                                controller
                                                    .setSelectedPlateNumber(
                                                        newValue ?? '');
                                              },
                                              value: controller
                                                  .selectedPlateNumber
                                                  .value, //updated
                                              items: [
                                                for (var value
                                                    in controller.trucks)
                                                  DropdownMenuItem(
                                                    value: value.plateNumber,
                                                    child: Text(
                                                      value.plateNumber ?? "",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge, //updated
                                                    ),
                                                  ),
                                              ]),
                                        ],
                                      )),
                                ),
                                /* SizedBox(
                                  height: 40,
                                ),*/
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: CustomMaterialButton(
                                        text: "إلغاء",
                                        function: () {Get.back();},
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: CustomMaterialButton(
                                        text: "إضافة",
                                        function: () {controller.addDriver(context);},
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
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
}
