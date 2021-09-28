import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';

class DataEmptyWidget extends StatelessWidget {
  final String text;
  const DataEmptyWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu_book,
            size: 130,
            color: CustomColors.gray,
          ),
          SizedBox(height: 10),
          Text(this.text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
