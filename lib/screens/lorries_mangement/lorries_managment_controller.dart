import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../models/fuel_details.dart';
import '../../models/trucks.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class LorriesManagementController extends GetxController {
  static final String token = UserStorage.read('token');

  late UserStorage storage;
  final plateNumberController = TextEditingController();
  final fuelTankCapacityfuelTypeController = TextEditingController();
  final cargoTankCapacityController = TextEditingController();
  final fuelTankFullCapacityController = TextEditingController();
  final cargoTankFullCapacityController = TextEditingController();
  List <FuelDetailsModel>fuelDetail = [];

  int fuelTankTypeId=0;
  int cargoTankTypeId=0;
  RxString selectedFuelTankType = "".obs;

  RxString selectedCargoTankType = "".obs;

  final isLoading = false.obs;
  late List<TrucksModel> trucks=[];
  @override
  void onInit() {
    getTrucks();
    getFuelDetails();

    super.onInit();
  }
  @override
  Future<void> onReady() async {
  //  getTrucks();
    print("onReady LorriesManagementController");

    super.onReady();

  }

  void setSelectedFuelTankType(String value){
    selectedFuelTankType.value = value;
    for (int i = 0; i < fuelDetail.length; i++) {
      if (fuelDetail[i].fuelTypeName == value) {

        fuelTankTypeId = fuelDetail[i].id!;

      }
    }print("fuelTankTypeId $fuelTankTypeId");
  }
  void setSelectedCargoTankType(String value){
    selectedCargoTankType.value = value;
    for (int i = 0; i < fuelDetail.length; i++) {
      if (fuelDetail[i].fuelTypeName == value) {

        cargoTankTypeId = fuelDetail[i].id!;

      }
    }print("cargoTankTypeId $cargoTankTypeId");
  }
  Future<void> getFuelDetails() async {
    print("getFuelDetails");
    try {
   //   isLoading(true);
      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getFuelDetails}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'

          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);
        fuelDetail.clear();
        for (int i = 0; i < body.length; i++) {
          fuelDetail.add(FuelDetailsModel(
            id: body[i]["id"],
            fuelTypeName: body[i]["fuelTypeName"],
            centerName: body[i]["centerName"],
            price: body[i]["price"],
          ));
        }print(body);
        selectedFuelTankType.value=fuelDetail[0].fuelTypeName??"";
            selectedCargoTankType.value=fuelDetail[0].fuelTypeName??"";
            fuelTankTypeId=fuelDetail[0].id!;
        cargoTankTypeId=fuelDetail[0].id!;
        print("fuelDetail length ${fuelDetail.length}");
        print(fuelDetail[0].fuelTypeName);
        print(fuelDetail[0].id);
        print(fuelDetail[1].fuelTypeName);
        print(fuelDetail[1].id);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
    //  isLoading(false);
    }
  }

  Future<void> getTrucks() async {

    print("getTrucks");
    try {  isLoading(true);
      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getTrucks}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(" response.statusCode  ${response.statusCode}");
        List<dynamic> body = json.decode(response.body);

        trucks.clear();
        for (int i = 0; i < body.length; i++) {
          trucks.add(TrucksModel(id:  body[i]["id"],
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

      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
  Future<void> addTruck(BuildContext context) async {
    print("addTruck");
    try {
      Map data = {
        "plateNumber": plateNumberController.text,
        "fuelTankCapacity":int.parse(fuelTankCapacityfuelTypeController.text),
        "cargoTankCapacity": int.parse(cargoTankCapacityController.text),
        "fuelTankFullCapacity": int.parse(fuelTankFullCapacityController.text),
        "cargoTankFullCapacity": int.parse(cargoTankFullCapacityController.text),
        "fuelTankTypeId": fuelTankTypeId,
        "cargoTankTypeId": cargoTankTypeId
      };
      print(data);

      /*final response  = await THttpHelper.post(
          endpoint: APIConstants.endPoints.addTruck, data: data);*/
   //   http.Response response1=response as http.Response;
      final response1 = await http.post(Uri.parse('${APIConstants.baseUrl}${APIConstants.endPoints.addTruck}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: json.encode(data));

      if (response1.statusCode == 201 || response1.statusCode == 200) {

        plateNumberController.clear();
        fuelTankCapacityfuelTypeController.clear();
        cargoTankCapacityController.clear();
        fuelTankFullCapacityController.clear();

        cargoTankFullCapacityController.clear();



        getTrucks();
        Get.toNamed(Routes.LORRIES_MANAGEMENT);
        THelperFunctions.showSnackBar(
            message: "تم إضافة الشاحنة بنجاح", title: "إضافة شاحنة");
     }

      //getProperties();
      //Get.back();
      //THelperFunctions.showSnackBar(message: 'تم إضافة السيّارة', title: '');
    } catch (e) {
      print(e);
    }
  }
}