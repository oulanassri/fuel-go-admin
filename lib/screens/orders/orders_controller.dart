import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../models/orders.dart';
import '../../native_service/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants/api_constants.dart';

class OrdersController extends GetxController {
  static final String token = UserStorage.read('token');
  var isLoading = false.obs;
  List<OrdersModel> orders = [];

  // final plateNumberController = TextEditingController();
  // final fuelTypeController = TextEditingController();
  // RxString selectedFuelType = "gas".obs;
  // final fuelTypeList=['gas', 'gas1', 'gas2','gas3', ];

  @override
  void onInit() {
    getOrdersByCenter();
    super.onInit();
  }
  @override
  void onReady() {
    print("onReady OrdersController");

    getOrdersByCenter();
    super.onReady();
  }
  // void setSelectedFuelType(String value){
  //   selectedFuelType.value = value;
  //
  //   update();
  // }
  Future<void> getOrdersByCenter() async {
    print("getOrdersByCenter");
    try {
      isLoading(true);

      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getOrdersByCenter}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);

        List<dynamic> body = json.decode(response.body);
        orders.clear();
        for (int i = 0; i < body.length; i++) {
          orders.add(
            OrdersModel(
              date: body[i]["date"].toString(),
              orderNumber: body[i]["orderNumber"].toString(),
              locationDescription: body[i]["locationDescription"].toString(),
              neighborhoodName: body[i]["neighborhoodName"].toString(),
              fuelTypeName: body[i]["fuelTypeName"].toString(),
              orderedQuantity: body[i]["orderedQuantity"].toString(),
              price: body[i]["price"].toString(),
              finalQuantity: body[i]["finalQuantity"].toString(),
              finalPrice: body[i]["finalPrice"].toString(),
              customerCarBrand: body[i]["customerCarBrand"].toString(),
              customerApartmentName: body[i]["customerApartmentName"].toString(),
              authCode: body[i]["authCode"].toString(),
              statusName: body[i]["statusName"].toString(),
              customerName:  body[i]["customerName"].toString(),
              customerPhone:  body[i]["customerPhone"].toString(),
              driverName:  body[i]["driverName"].toString(),
              driverPhone:  body[i]["driverPhone"].toString(),
              deliveryFee: body[i]["deliveryFee"].toString(),
            ),
          );
        }
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
      //Get.back();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

}