import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../models/trucks.dart';
import '../../common_components/custom_edit_text_form_field.dart';
import '../../common_components/custom_small_button.dart';
import '../../constants.dart';
import '../../common_components/header.dart';
import '../../common_components/custom_material_button.dart';
import '../../common_components/custom_text_form_field.dart';
import '../../orders/components/row_details.dart';
import '../lorries_managment_controller.dart';
import 'custom_lorry_details.dart';

class LorryDetails extends StatelessWidget {
  const LorryDetails({Key? key, required this.trucksModel})
      : super(key: key);
  final TrucksModel trucksModel;

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
                        title: 'تفاصيل الشّاحنة',
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),

                      FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding * 3),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  RowDetails(
                                    title: 'رقم اللّوحة',
                                    label: trucksModel.plateNumber.toString()??"",
                                  ),
                                  RowDetails(
                                    title: ' نوع وقود خزان الشاحنة الخارجي',
                                    label:trucksModel.cargoTankTypeName.toString()??"",
                                  ),
                                  RowDetails(
                                    title: 'كمية الوقود بخزان الشاحنة الخارجي',
                                    label: trucksModel.cargoTankCapacity.toString()??"",
                                  ),
                                  RowDetails(
                                    title: 'نوع وقود خزان الشاحنة',
                                    label: trucksModel.fuelTankTypeName.toString()??"",
                                  ),
                                  RowDetails(
                                    title: 'كمية وقود خزان الشاحنة',
                                    label: trucksModel.fuelTankCapacity.toString()??"",
                                  ),
                                ],
                              ),
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
