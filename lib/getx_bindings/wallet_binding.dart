import 'package:get/get.dart';

import '../screens/wallets_management/wallets_controller.dart';


class WalletsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(WalletsController());
  }

}