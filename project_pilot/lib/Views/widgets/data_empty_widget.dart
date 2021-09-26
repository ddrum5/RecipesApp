import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/helper/custom_color.dart';

class DataEmptyWidget extends StatelessWidget {
  final String text;
  const DataEmptyWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu_book, size: 150, color: CustomColor.grayDark,),
        SizedBox(height: 10),
        Text(this.text , style: TextStyle(fontSize: 25, color: CustomColor.grayDark)),
      ],
    );

  }
}
