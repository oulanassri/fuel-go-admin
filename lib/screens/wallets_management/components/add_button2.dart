import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../routes/app_routes.dart';
import '../../constants.dart';
import '../../responsive.dart';

class AddButton2 extends StatelessWidget {
  AddButton2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: defaultPadding,
        ),
        ElevatedButton.icon(
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
              ),
              backgroundColor: primaryButton),
          onPressed: () {
            Get.toNamed(Routes.WALLET_CHARGING_SCREEN);
          },
          icon: Icon(
            Icons.add,
            color: primaryIcon,
          ),
          label: Text(
            'تعبئة المحفظة',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
