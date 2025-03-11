import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../models/drivers.dart';
import '../../native_service/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants/api_constants.dart';

class DriversManagementController extends GetxController {
  static final String token = UserStorage.read('token');
  late UserStorage storage;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final lorryNumberController = TextEditingController();
  final plateNumberController = TextEditingController();
  final shiftsList=['shift1', 'shift2', 'shift3','shift4', 'shift5', 'shift6',];
  final plateNumbersList=['plate1', 'plate2', 'plate3'];
  RxString selectedShift = "shift1".obs;
  RxString selectedPlateNumber = "plate1".obs;
  final isUploading = false.obs;
  late List<DriversModel> drivers=[];

  @override
  void onInit() {
    storage = UserStorage();
    getDrivers();
    super.onInit();
  }
  void setSelectedSift(String value){
    selectedShift.value = value;

    update();
  }

  void setSelectedPlateNumber(String value){
    selectedPlateNumber.value = value;
    update();
  }
  Future<void> getDrivers() async {
    isUploading(true);
    print("getDrivers");
    try {
      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getDrivers}'),
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
          drivers.add(DriversModel(
              name: body[i]["name"],
              phone: body[i]["phone"],
              email: body[i]["email"]));
        }
        print(drivers.length);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isUploading(false);
    }
  }
}