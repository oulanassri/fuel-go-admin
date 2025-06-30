import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../models/fuel_details.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';

class SettingsController extends GetxController {
  final String token = UserStorage.read('token');

  var isLoading = false.obs;
  List<FuelDetailsModel> fuelDetail = [];
  late int fuelTypeIdEdit;
  final servicePriceController = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController renewPassword = TextEditingController();
  // RxString selectedFuelType = "gas".obs;
  // final fuelTypeList=['gas', 'gas1', 'gas2','gas3', ];
  TimeOfDay time = TimeOfDay(hour: 7, minute: 30);

  @override
  void onInit() {
    getFuelDetails();
    super.onInit();
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 7, minute: 30);
    final newTime = await showTimePicker(
        context: context, initialTime: time ?? initialTime);
  }

  Future<void> getFuelDetails() async {
    print("getFuelDetails");
    try {
      isLoading(true);
      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getFuelDetails}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);
        print(body);
        for (int i = 0; i < body.length; i++) {
          fuelDetail.add(FuelDetailsModel(
            id: body[i]["id"],
            fuelTypeName: body[i]["fuelTypeName"],
            centerName: body[i]["centerName"],
            price: body[i]["price"],
          ));
        }
         print(response.statusCode);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
  Future<void> editPassword() async {
    Get.back();

    print("editPassword");
    try {isLoading(true);
    Map data ={
      "oldPassword": oldPassword.text,
      "password": newPassword.text,
      "rePassword":  renewPassword.text
    };
    print(data);


    final response = await http.put(Uri.parse('${APIConstants.baseUrl}${APIConstants.endPoints.editPassword}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(data));
    print("response statusCode  ${response.statusCode}");
    print("response body  ${response.body}");
    if (response.statusCode == 200 ) {
      THelperFunctions.showSnackBar(
          message: 'تم تغيير كلمة السّر بنجاح', title: 'تغيير كلمة السّر');
      oldPassword.clear();
      newPassword.clear();
      renewPassword.clear();

    } else {
      THelperFunctions.showSnackBar(
          message: response.body, title: 'تغيير كلمة السّر');
      throw Exception('Failed to load date: ${response.statusCode}');
    }



    } catch (e) {
      print(e);
    }finally{
      isLoading(false);
    }
  }
  Future<void> editFuelPrice() async {
    print("editFuelPrice");
    try {
      Map data = {
        "fuelTypeId": fuelTypeIdEdit,
        "price": int.parse(servicePriceController.text)
      };
      print(data);
      final response = await http.post(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.editFuelPrice}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: json.encode([data]));

      print("response.statusCode  ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        fuelDetail.clear();
        getFuelDetails();
        THelperFunctions.showSnackBar(
            message: 'تم تعديل سعر الوقود', title: 'تعديل سعر الوقود');
        servicePriceController.clear();
        Get.toNamed(Routes.SETTINGS_SCREEN);
      }else{
        THelperFunctions.showSnackBar(
            message: 'حدث خطأ ما يُرجى إعادة المحاولة', title: 'تعديل سعر الوقود');
      }
      //getProperties();
      //Get.back();
      //THelperFunctions.showSnackBar(message: 'تم إضافة السيّارة', title: '');
    } catch (e) {
      THelperFunctions.showSnackBar(
          message: 'حدث خطأ ما يُرجى إعادة المحاولة', title: 'تعديل سعر الوقود');
      print(e);
    }
  }
// void setSelectedFuelType(String value){
//   selectedFuelType.value = value;
//
//   update();
// }
}
