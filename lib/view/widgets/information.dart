import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../utils/theme.dart';

class Information extends StatelessWidget {
  final String heading;
  final String info;
  Information(this.heading, this.info);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          heading,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: 20, color: primaryColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          info,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 15,
            color: primaryColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ));
  }
}
