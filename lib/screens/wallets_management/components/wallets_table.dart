import 'package:admin_fuel_go/screens/wallets_management/components/add_button2.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../common_components/header.dart';
import 'custom_wallets_table.dart';

class WalletsTable extends StatelessWidget {
  const WalletsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [

            SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Header(title: 'إدارة المحفظات',),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      AddButton2(),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      CustomWalletsTable(),


                    ],
                  ),
                ),

                Expanded(flex:1,child: SizedBox())
              ],
            ),
          ],
        ),
      ),
    );
  }
}