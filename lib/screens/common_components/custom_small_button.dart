import 'package:flutter/material.dart';

import '../constants.dart';

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({Key? key,
    required this.route,
    required this.text,
    required this.function})
      : super(key: key);
  final String route;
  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 130,
        //  padding: EdgeInsets.symmetric(horizontal:),

        height: 30,
        // margin: EdgeInsets.symmetric(horizontal: 50),

        decoration: BoxDecoration(
          color: primaryButton,
          borderRadius: BorderRadius.circular(50),
          shape: BoxShape.rectangle,
        ),
        // decoration: BoxDecoration(
        // ),
        child: Center(
          child: Text(
            text,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
        ),
      ),
      onTap: function,
    );
  }
}
