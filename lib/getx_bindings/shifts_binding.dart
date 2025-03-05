import 'package:get/get.dart';

import '../screens/shifts_management/shefts_controller.dart';


class ShiftsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ShiftsController());
  }

}