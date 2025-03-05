import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../common_components/side_menu.dart';
import '../constants.dart';
import '../responsive.dart';
import 'components/lorry_details.dart';
import 'lorries_managment_controller.dart';
class LorryDetailsScreen extends GetView<LorriesManagementController> {
  const LorryDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradientColorBg),
      child: Scaffold(backgroundColor: Colors.transparent,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  child: SideMenu(),
                ),
              Expanded(
                flex: 5,
                child: LorryDetails(
                  controller: controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
