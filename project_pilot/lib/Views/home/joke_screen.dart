
import 'package:flutter/material.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:share/share.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class JokeScreen extends StatelessWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.joke??''),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share('check out my youtube channel https://youtube.com/c/ddrum_16');
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: CustomColors.grayLite,
            width: 2,

          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 217,
                child: Stack(
                  alignment: Alignment(0.8, 0.9),
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 16, right: 16, bottom: 50),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                        "sed do eiusmod tempor incididunt ut labore et dolore magna ",
                        style: Theme.of(context)
                          .textTheme
                          .headline6?.copyWith(fontSize: 23)
                      ),
                    ),
                    Text(
                      "01/01/2021",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ))),
      ),
    );
  }
}
