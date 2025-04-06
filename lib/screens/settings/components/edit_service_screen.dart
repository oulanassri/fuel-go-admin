import 'package:admin_fuel_go/screens/settings/settings_controller.dart';
import 'package:admin_fuel_go/screens/shifts_management/shefts_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../utils/helpers/helper_functions.dart';
import '../../common_components/custom_material_button.dart';
import '../../common_components/custom_text_form_field.dart';
import '../../common_components/header.dart';
import '../../common_components/side_menu.dart';
import '../../constants.dart';
import '../../responsive.dart';

class EditServiceScreen extends GetView<SettingsController> {
  const EditServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            spacing: defaultPadding,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context) || Responsive.isTablet(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Header(
                      title: 'تعديل خدمة',
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
                                hintText: "سعر الخدمة",
                                controller: controller.servicePriceController,
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
                                      text: "إلغاء",
                                      function: () {},
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(defaultPadding),
                                    child: CustomMaterialButton(
                                      text: "تعديل",
                                      function: () {
                                        if (controller.servicePriceController
                                            .text.isEmpty) {
                                          THelperFunctions.showSnackBar(
                                              message:
                                                  'يُرجى إدخال السّعر الجديد',
                                              title: 'رسالة خطأ');
                                        } else {
                                          controller.editFuelPrice();
                                        }
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
              Expanded(child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
