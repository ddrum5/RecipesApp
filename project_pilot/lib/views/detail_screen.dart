import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/detail/details_viewmodel.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/views/detail/ingredients_screen.dart';
import 'package:project_pilot/views/detail/instructions_screen.dart';
import 'package:project_pilot/views/detail/overview_screen.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final detailsViewModel = DetailsViewModel.getInstance();

  DetailScreen(this.id);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.detailsViewModel.getOverViewData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Details",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      content: Text('Yay! A SnackBar!'),
                      action: SnackBarAction(
                        textColor:  CustomColor.brightVioletLight,
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  },
                  icon: Icon(
                    Icons.star,
                    color: Colors.white,
                  )),
            ],
            bottom: TabBar(
              tabs: [
                Container(
                  padding: EdgeInsets.only(bottom: 14),
                  child: Text(
                    "Overview",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Text(
                      "Ingredients",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                Container(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Text(
                      "Instructions",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              OverviewScreen(widget.detailsViewModel),
              IngredientsScreen(widget.detailsViewModel),
              InstructionsScreen(widget.detailsViewModel),
            ],
          ),
        ));
  }
}
