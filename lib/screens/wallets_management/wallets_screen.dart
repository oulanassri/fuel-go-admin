import 'package:admin_fuel_go/screens/wallets_management/wallets_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../common_components/side_menu.dart';
import '../constants.dart';
import '../responsive.dart';
import 'components/custom_charging_wallet.dart';
import 'components/wallets_table.dart';

class WalletsScreen extends GetView<WalletsController> {
  const WalletsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WalletsController());
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
                child:CustomChargingWallet(controller: controller,),// WalletsTable(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
