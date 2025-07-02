
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';
import 'package:http/http.dart' as http;

class WalletsController extends GetxController {
   final phoneNumberController = TextEditingController();
  final amountOfMoneyController = TextEditingController();
  final codeController = TextEditingController();

  // final fuelTypeController = TextEditingController();
  // RxString selectedFuelType = "gas".obs;
  // final fuelTypeList=['gas', 'gas1', 'gas2','gas3', ];

  @override
  void onInit() {
    super.onInit();
  }
   Future<void> chargeWallet() async {
     print("chargeWallet");
     try {
       Map data ={
         "phone": phoneNumberController.text,
         "otp": codeController.text,
         "amount": int.parse(amountOfMoneyController.text)
       };
       print(data);
       final response  = await THttpHelper.post(
           endpoint: APIConstants.endPoints.chargeWallet, data: data);



       phoneNumberController.clear();
       amountOfMoneyController.clear();
       codeController.clear();
       Get.toNamed(Routes.WALLETS_SCREEN);
       THelperFunctions.showSnackBar(
           message: "تم تعبئة النقود بنجاح", title: "تعبئة نقود");

     } catch (e) {
       THelperFunctions.showSnackBar(
           message: 'حدث خطأ ما يُرجى إعادة المحاولة', title: 'تعبئة نقود');
       if (kDebugMode) {
         print(e);
       }
     } finally {


     }
   }
// void setSelectedFuelType(String value){
//   selectedFuelType.value = value;
//
//   update();
// }
}