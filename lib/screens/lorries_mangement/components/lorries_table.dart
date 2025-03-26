import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../common_components/header.dart';
import '../../responsive.dart';
import '../lorries_managment_controller.dart';
import 'add_button.dart';
import 'custom_Lorries_table.dart';

class LorriesTable extends StatelessWidget {
   LorriesTable({Key? key,required this.controller}) : super(key: key);
  LorriesManagementController controller;
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
                      Header(title: 'إدارة الشّاحنات',),
                      SizedBox(
                        height: defaultPadding,
                      ),
                     AddButton(),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      CustomLorriesTable(controller: controller,),


                    ],
                  ),
                ),

                Expanded(flex:1,child: SizedBox())
              ],
            ),
          ],
        ),
      ),
    );
  }
}