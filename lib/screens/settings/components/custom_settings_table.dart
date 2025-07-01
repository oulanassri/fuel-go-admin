import 'package:admin_fuel_go/screens/shifts_management/shefts_controller.dart';
import 'package:flutter/material.dart';
import 'package:admin_fuel_go/screens/shifts_management/components/add_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/fuel_details.dart';
import '../../../models/service.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/validators/validation.dart';
import '../../common_components/common_material_button.dart';
import '../../common_components/custom_material_button.dart';
import '../../common_components/custom_text_form_field1.dart';
import '../../common_components/header.dart';
import '../../constants.dart';
import '../settings_controller.dart';

class CustomSettingsTable extends StatelessWidget {
  CustomSettingsTable({
    super.key,
    required this.controller
  });
  SettingsController controller;
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
            */
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
                        title: ' الإعدادات',
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 100),
                        child: Obx(() => controller.isLoading.value
                            ? MaterialButton(
                          onPressed: () {},
                          height: 50,
                          // margin: EdgeInsets.symmetric(horizontal: 50),
                          color: primaryButton,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          // decoration: BoxDecoration(
                          // ),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          ),
                        )
                            : CommonMaterialButton(
                          title: 'تغيير كلمة السّر',
                          function: () {
                            Get.defaultDialog(
                                cancelTextColor: secondaryButton,
                                buttonColor: secondaryButton,
                                title: "تغيير كلمة السّر",
                                textConfirm: "تغيير",
                                textCancel: "إلغاء",
                                titleStyle:
                                Theme.of(context).textTheme.labelMedium,
                                content: Column(
                                  children: [
                                    CustomTextFormField1(
                                      hintText: 'كلمة السّر القديمة',
                                      controller: controller.oldPassword,
                                    ),
                                    CustomTextFormField1(
                                      hintText: 'كلمة السّر الجديدة',
                                      controller: controller.newPassword,
                                    ),
                                    CustomTextFormField1(
                                      hintText: 'كلمة السّر الجديدة مرة أخرى',
                                      controller: controller.renewPassword,
                                    ),
                                  ],
                                ),
                                onConfirm: () {
                                  print("confirm");
                                  if (TValidator.isValidatePassword(
                                      controller.newPassword.text) &&
                                      (controller.newPassword.text ==
                                          controller.renewPassword.text)) {
                                    controller.editPassword();
                                  } else {
                                    String? message1 = "", message2 = "";
                                    if (!(TValidator.isValidatePassword(
                                        controller.newPassword.text))) {
                                      message1 = TValidator.validatePassword(
                                          controller.newPassword.text);
                                    }
                                    if (controller.newPassword.text !=
                                        controller.renewPassword.text) {
                                      message2 = "كلمتا السّر غير متطابقتان";
                                    }
                                    THelperFunctions.showSnackBar(
                                        title: "رسالة خطأ",
                                        message: "$message1 , $message2 ");
                                  }
                                },
                                onCancel: () {
                                  print("cancel");
                                });
                          },
                        )),
                      ), SizedBox(
                        height: defaultPadding,
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Container(
                        padding: EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Obx(() => controller.isLoading.value
                            ? Center(
                          child: CircularProgressIndicator(color: primaryColor,),
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
                                      "رقم الخدمة",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "اسم المركز",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "نوع الوقود",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "السعر",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),

                                ],
                                rows: List.generate(
                                  controller.fuelDetail.length,
                                      (index) =>
                                      serviceDataRow(controller.fuelDetail[index], context),
                                ),
                              ),
                            ),
                          ],
                        )),
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

  DataRow serviceDataRow(FuelDetailsModel fuelDetailsModel, BuildContext context) {
    return DataRow(
      onLongPress: (){
        controller.fuelTypeIdEdit=fuelDetailsModel.fuelTypeId??0;
        Get.toNamed(Routes.EDIT_SERVICE_SCREEN);
      },
      cells: [
        DataCell(
          Text(
            fuelDetailsModel.fuelTypeId.toString() ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            fuelDetailsModel.centerName ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            fuelDetailsModel.fuelTypeName ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            fuelDetailsModel.price.toString() ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
