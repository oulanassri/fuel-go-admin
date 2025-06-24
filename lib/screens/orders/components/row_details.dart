import 'package:admin_fuel_go/screens/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowDetails extends StatelessWidget {
  const RowDetails({Key? key, required this.title, required this.label})
      : super(key: key);
  final String title, label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Row(
        children: [
         /* Image.network(
            'https://emojicdn.elk.sh/💵', // خدمة تحوّل الإيموجي لصورة
            width: 24,
            height: 24,
          ),*/
          //Icon(Icons.inbox),
          Text("$title :", style: Theme.of(context).textTheme.titleLarge),
          Text(
            "$label ",
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
