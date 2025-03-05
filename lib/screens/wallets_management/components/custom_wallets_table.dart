import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/driver_model.dart';
import '../../../models/recent_file.dart';
import '../../../models/wallet.dart';
import '../../../routes/app_routes.dart';
import '../../constants.dart';

class CustomWalletsTable extends StatelessWidget {
  const CustomWalletsTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label: Text(
                    "رقم المحفظة",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "الاسم",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DataColumn(
                  label: Text("الهاتف",
                    style: Theme.of(context).textTheme.titleLarge,),
                ),
                DataColumn(
                  label: Text("كمية النقود",
                    style: Theme.of(context).textTheme.titleLarge,),
                ),

              ],
              rows: List.generate(
                walletsList.length,
                (index) => walletDataRow(walletsList[index],context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow walletDataRow(WalletModel walletModel,BuildContext context) {
    return DataRow(

      cells: [
        DataCell(
          Text(walletModel.id ?? "",
            style:Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(walletModel.name ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(walletModel.phone ?? "",
            style: Theme.of(context).textTheme.bodyLarge,),
        ),
        DataCell(
          Text(walletModel.amountOfMoney.toString() ?? "",
            style:Theme.of(context).textTheme.bodyLarge,),
        ),

      ],
    );
  }
}
