import 'package:admin_fuel_go/screens/orders/components/row_details.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
class FuelOrderDetails extends StatelessWidget {
  const FuelOrderDetails(
      {Key? key,
        required this.date,
        required this.neighborhoodName,
        required this.locationDescription,
        required this.fuelTypeName,
        required this.finalQuantity,
        required this.finalPrice, required this.orderedQuantity, required this.price})
      : super(key: key);
  final String date,
      neighborhoodName,
      locationDescription,
      fuelTypeName,
      finalQuantity,
      finalPrice,orderedQuantity,price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding),
            width: MediaQuery.of(context).size.width / 3,
            height: 50,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Center(
              child: Text(
                "تفاصيل الطلب",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          RowDetails(
            title: 'تاريخ الطلب',
            label: date,
          ),
          RowDetails(
            title: 'الموقع',
            label: locationDescription,
          ),
          RowDetails(
            title: 'نوع الوقود',
            label: fuelTypeName,
          ),
          RowDetails(
            title: 'كمية التعبئة',
            label:orderedQuantity.isNotEmpty?orderedQuantity:finalQuantity,
          ),
          RowDetails(
            title: 'الكلفة الإجمالية',
            label:price.isNotEmpty?price: finalPrice,
          ),
        ],
      ),
    );
  }
}

