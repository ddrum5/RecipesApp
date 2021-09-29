import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildSnackBar {
  static void  showSnackBar(BuildContext context, String text) {

    final snackBar = SnackBar(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      content: Text(text),
      action: SnackBarAction(
        textColor: CustomColors.purplishBlue,
        label: AppLocalizations.of(context)?.ok ?? '',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
