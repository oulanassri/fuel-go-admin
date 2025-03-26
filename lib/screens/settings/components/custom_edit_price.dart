// import 'package:admin_fuel_go/screens/wallets_management/components/add_button2.dart';
// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
//
// import '../../common_components/custom_material_button.dart';
// import '../../common_components/custom_text_form_field.dart';
// import '../../constants.dart';
// import '../../common_components/header.dart';
// import '../settings_controller.dart';
//
// class CustomEditPrice extends StatelessWidget {
//   CustomEditPrice({Key? key, required this.controller}) : super(key: key);
//   final SettingsController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(defaultPadding),
//         child: Column(
//           children: [
//             SizedBox(
//               height: defaultPadding,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 5,
//                   child: Column(
//                     children: [
//                       Header(
//                         title: 'تعبئة محفظة',
//                       ),
//                       SizedBox(
//                         height: defaultPadding,
//                       ),
//                       FadeInUp(
//                           duration: Duration(milliseconds: 1400),
//                           child: Container(
//                             padding: EdgeInsets.all(defaultPadding * 3),
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Color.fromRGBO(225, 95, 27, .3),
//                                       blurRadius: 20,
//                                       offset: Offset(0, 10))
//                                 ]),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisSize: MainAxisSize.min,
//                               children: <Widget>[
//                                 CustomTextFormField(
//                                   hintText: "رقم الهاتف",
//                                   controller: controller.phoneNumberController,
//                                 ),
//                                 CustomTextFormField(
//                                   hintText: "المبلغ",
//                                   controller:
//                                   controller.amountOfMoneyController,
//                                 ),
//                                 CustomTextFormField(
//                                   hintText: "السعر الجديد",
//                                   controller: controller.codeController,
//                                 ),
//                                 SizedBox(
//                                   height: 40,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.all(defaultPadding),
//                                       child: CustomMaterialButton(
//                                         route: "Routes.MAIN_SCREEN",
//                                         text: "إلغاء",
//                                         function: () {},
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(defaultPadding),
//                                       child: CustomMaterialButton(
//                                         route: "Routes.MAIN_SCREEN",
//                                         text: "تعبئة",
//                                         function: () {
//                                           controller.chargeWallet();
//                                         },
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           )),
//                     ],
//                   ),
//                 ),
//                 Expanded(flex: 1, child: SizedBox())
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
