import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../common_components/custom_edit_text_form_field.dart';
import '../../constants.dart';
import '../../common_components/header.dart';
import '../lorries_managment_controller.dart';
import '../../common_components/custom_material_button.dart';
import '../../common_components/custom_text_form_field.dart';
import '../../responsive.dart';
import 'add_button.dart';

class AddingLorryWidget extends StatelessWidget {
  const AddingLorryWidget({Key? key, required this.controller})
      : super(key: key);
  final LorriesManagementController controller;

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
                        title: 'إضافة شاحنة',
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
                                  hintText: "رقم اللوحة",
                                  controller: controller.plateNumberController,
                                ),

                                /* CustomTextFormField(
                                  hintText: "نوع الوقود",
                                  controller: controller.fuelTypeController,
                                ),*/
                                CustomTextFormField(
                                  hintText: "السّعة الكاملة لتعبئة الشاحنة",
                                  controller: controller.cargoTankFullCapacityController,
                                ),
                                CustomTextFormField(
                                  hintText: "كمية التعبئة الحاليّة",
                                  controller: controller.cargoTankCapacityController,
                                ),

                                CustomTextFormField(
                                  hintText: "السّعة خزان وقود الشاحنة",
                                  controller: controller.fuelTankFullCapacityController,
                                ),
                                CustomTextFormField(
                                  hintText: "كمية وقود الشاحنة",
                                  controller: controller.fuelTankCapacityfuelTypeController,
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
                                            "اختر نوع وقود خزان الشاحنة",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          DropdownButton<String>(
                                              // updated
                                              onChanged: (String? newValue) {
                                                controller.setSelectedFuelType(
                                                    newValue ?? '');
                                              },
                                              value: controller.selectedFuelType
                                                  .value, //updated
                                              items: [
                                                for (var value
                                                    in controller.fuelTypeList)
                                                  DropdownMenuItem(
                                                    value: value,
                                                    child: Text(
                                                      value,
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
                                            "اختر نوع وقود خزان الشاحنة",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          DropdownButton<String>(
                                            // updated
                                              onChanged: (String? newValue) {
                                                controller.setSelectedFuelType(
                                                    newValue ?? '');
                                              },
                                              value: controller.selectedFuelType
                                                  .value, //updated
                                              items: [
                                                for (var value
                                                in controller.fuelTypeList)
                                                  DropdownMenuItem(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge, //updated
                                                    ),
                                                  ),
                                              ]),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: CustomMaterialButton(
                                        route: "Routes.MAIN_SCREEN",
                                        text: "إلغاء",
                                        function: () {},
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: CustomMaterialButton(
                                        route: "Routes.MAIN_SCREEN",
                                        text: "إضافة",
                                        function: () {
                                          controller.addTruck();
                                        },
                                      ),
                                    )
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
