import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../common_components/custom_edit_text_form_field.dart';
import '../../common_components/custom_small_button.dart';
import '../../constants.dart';
import '../../common_components/header.dart';
import '../../common_components/custom_material_button.dart';
import '../../common_components/custom_text_form_field.dart';
import '../lorries_managment_controller.dart';

class LorryDetails extends StatelessWidget {
  const LorryDetails({Key? key, required this.controller})
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
                        title: 'تفاصيل السّائق',
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
                                Align(
                               alignment: Alignment.topLeft,
                                  child: CustomSmallButton(
                                    route: "Routes.MAIN_SCREEN",
                                    text: "حذف الشاحنة", function: () {  },
                                  ),
                                ),
                                CustomEditTextFormField(
                                  hintText: "رقم اللوحة",
                                  controller: controller.plateNumberController,
                                ),
                                CustomEditTextFormField(
                                  hintText: "نوع الوقود",
                                  controller: controller.fuelTypeController,
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
                                        route: "Routes.MAIN_SCREEN",
                                        text: "إلغاء", function: () {  },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: CustomMaterialButton(
                                        route: "Routes.MAIN_SCREEN",
                                        text: "تعديل", function: () {  },
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
