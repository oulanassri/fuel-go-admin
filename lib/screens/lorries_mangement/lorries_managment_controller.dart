import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../models/trucks.dart';
import '../../native_service/get_storage.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';
import 'package:http/http.dart' as http;

class LorriesManagementController extends GetxController {
  static final String token = UserStorage.read('token');

  late UserStorage storage;
  final plateNumberController = TextEditingController();
  final fuelTankCapacityfuelTypeController = TextEditingController();
  final cargoTankCapacityController = TextEditingController();
  final fuelTankFullCapacityController = TextEditingController();
  final cargoTankFullCapacityController = TextEditingController();
int fuelTankTypeId=1;
  int cargoTankTypeId=1;
  RxString selectedFuelType = "gas".obs;
  final fuelTypeList=['gas', 'gas1', 'gas2','gas3', ];
  final isUploading = false.obs;
  late List<TrucksModel> trucks=[];
  @override
  void onInit() {
    storage = UserStorage();
    getTrucks();
    super.onInit();
  }
  void setSelectedFuelType(String value){
    selectedFuelType.value = value;

    update();
  } Future<void> getTrucks() async {
    isUploading(true);
    print("getTrucks");
    try {
      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getTrucks}'),
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
          trucks.add(TrucksModel(
              plateNumber: body[i]["plateNumber"],
              lat: body[i]["lat"],
              long: body[i]["long"],
            fuelTankCapacity: body[i]["fuelTankCapacity"],

            cargoTankCapacity: body[i]["cargoTankCapacity"],

            fuelTankFullCapacity: body[i]["fuelTankFullCapacity"],

            cargoTankFullCapacity: body[i]["cargoTankFullCapacity"],
            fuelTankTypeName: body[i]["fuelTankTypeName"],
            cargoTankTypeName: body[i]["cargoTankTypeName"],


          ));
        }
        print(trucks.length);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isUploading(false);
    }
  }
  Future<void> addTruck() async {
    print("addTruck");
    try {
      Map data = {
        "plateNumber": plateNumberController.text,
        "fuelTankCapacity": fuelTankCapacityfuelTypeController.text,
        "cargoTankCapacity": cargoTankCapacityController.text,
        "fuelTankFullCapacity": fuelTankFullCapacityController.text,
        "cargoTankFullCapacity": cargoTankFullCapacityController.text,
        "fuelTankTypeId": "1",
        "cargoTankTypeId": "1"
      };
      print(data);
      Map<String, dynamic> body = await THttpHelper.post(
          endpoint: APIConstants.endPoints.addTruck, data: data);
      print(body.toString());

      plateNumberController.clear();
      fuelTankCapacityfuelTypeController.clear();
      cargoTankCapacityController.clear();
      fuelTankFullCapacityController.clear();
      cargoTankFullCapacityController.clear();
      //getProperties();
      //Get.back();
      //THelperFunctions.showSnackBar(message: 'تم إضافة السيّارة', title: '');
    } catch (e) {
      print(e);
    }
  }
}