import 'package:flutter/material.dart';

class CustomEditTextFormField extends StatelessWidget {
  const CustomEditTextFormField(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            label: Text(
              hintText,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            labelStyle: Theme.of(context).textTheme.labelLarge,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey,),
            border: InputBorder.none),
      ),
    );
  }
}
