import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../models/shifts.dart';
import '../../native_service/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants/api_constants.dart';

class ShiftsController extends GetxController {
  static final String token = UserStorage.read('token');

  final isUploading = false.obs;
  late List<ShiftsModel> shifts=[];

  // final plateNumberController = TextEditingController();
  // final fuelTypeController = TextEditingController();
  // RxString selectedFuelType = "gas".obs;
  // final fuelTypeList=['gas', 'gas1', 'gas2','gas3', ];
  TimeOfDay time = TimeOfDay(hour: 7, minute: 30);

  @override
  void onInit() {
    getShifts();
    super.onInit();
  }

  Future<void> getShifts() async {
    isUploading(true);
    print("getShifts");
    try {
      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getShifts}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(" response.statusCode  ${response.statusCode}");
        List<dynamic> body = json.decode(response.body);
        print(body);
        print(body.length);

        for (int i = 0; i < body.length; i++) {
          shifts.add(ShiftsModel(
              shiftName: body[i]["shiftName"],
              startTime: body[i]["startTime"],
              endTime: body[i]["endTime"]));
        }
        print(shifts.length);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isUploading(false);
    }
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 7, minute: 30);
    final newTime = await showTimePicker(
        context: context, initialTime: time ?? initialTime);
  }
// void setSelectedFuelType(String value){
//   selectedFuelType.value = value;
//
//   update();
// }
}
