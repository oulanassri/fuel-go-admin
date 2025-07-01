import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../models/drivers.dart';
import '../../models/shifts.dart';
import '../../models/trucks.dart';
import '../../native_service/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../routes/app_routes.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';
import '../constants.dart';

class DriversManagementController extends GetxController {
  static final String token = UserStorage.read('token');
  late UserStorage storage;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final lorryNumberController = TextEditingController();
  final plateNumberController = TextEditingController();
  final passwordController = TextEditingController();

  RxString selectedShift = "".obs;
  late RxInt selectedShiftId = 1.obs;
  late RxInt selectedPlateNumberId = 0.obs;

  RxString selectedPlateNumber = "".obs;
  final isLoading = false.obs;
  late List drivers = [].obs;
  late List trucks = [].obs;
  late List<ShiftsModel> shifts = [];

  @override
  void onInit() {
    getDrivers();
    getTrucks();
    getShifts();
    super.onInit();
  }

  @override
  void onReady() {
    getTrucks();
    getShifts();
   print("onReady DriversManagementController");
    super.onReady();
  }

  void setSelectedSift(String value) {
    selectedShift.value = value;
    for (int i = 0; i < trucks.length; i++) {
      if (shifts[i].shiftName == value) {
        print(shifts[i].shiftName);
        selectedShiftId.value = shifts[i].id!;
      }
    }
  }

  void setSelectedPlateNumber(String value) {
    selectedPlateNumber.value = value;
    for (int i = 0; i < trucks.length; i++) {
      if (trucks[i].plateNumber == value) {
        print(trucks[i].plateNumber);
        selectedPlateNumberId.value = trucks[i].id!;
      }
    }
  }

  Future<void> getDrivers() async {
    print("getDrivers");
    try {
      isLoading(true);
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
drivers.clear();
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
      isLoading(false);
    }
  }

  Future<void> getTrucks() async {
    print("getTrucks");
    try {
      isLoading(true);
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
        trucks.clear();
        for (int i = 0; i < body.length; i++) {
          trucks.add(TrucksModel(
            id: body[i]["id"],
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
        selectedPlateNumberId.value=trucks[0].id;
        selectedPlateNumber.value = trucks[0].plateNumber!;
        print(trucks.length);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getShifts() async {
    print("getShifts");
    try {
      isLoading(true);
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
        shifts.clear();
        for (int i = 0; i < body.length; i++) {
          shifts.add(ShiftsModel(
              id: body[i]["id"],
              shiftName: body[i]["shiftName"],
              startTime: body[i]["startTime"],
              endTime: body[i]["endTime"]));
        }
        selectedShift.value = shifts[0].shiftName!;
        selectedShiftId.value=shifts[0].id!;
        print(shifts.length);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> addDriver(BuildContext context) async {
    print("addDriver");
    try {
      Map data = {
        "name": nameController.text,
        "phone": phoneController.text,
        "email": emailController.text,
        "shiftId": selectedShiftId.value,
        "truckId": selectedPlateNumberId.value
      };
      print(data);

      final response1 = await http.post(Uri.parse('${APIConstants.baseUrl}${APIConstants.endPoints.addDriver}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: json.encode(data));


      print("response.statusCode ${response1.statusCode}");
      print("response.statusCode ${response1.body}");
      if (response1.statusCode == 201 || response1.statusCode == 200) {
        print("response.statusCode ${response1.statusCode}");
        emailController.clear();
        phoneController.clear();
        nameController.clear();


        THelperFunctions.showSnackBar(
            message: "تم إضافة السائق بنجاح", title: "إضافة سائق");


        getDrivers();
        Get.toNamed(Routes.DRIVERS_MANAGEMENT);
        // return json.decode(response1.body);
      } else {
        THelperFunctions.showSnackBar(
            message: "حدث خطأ ما،يُرجى إعادة المحاولة ", title: "رسالة خطأ");
        print(response1.body);
          throw Exception('Failed to load date: ${response1.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {}
  }
}
