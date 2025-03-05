import 'package:get/get.dart';

import '../screens/lorries_mangement/lorries_managment_controller.dart';



class LorriesBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LorriesManagementController());
  }

}