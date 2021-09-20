import 'package:flutter/material.dart';
import 'package:project_pilot/view_models/detail_viewmodel/ingredients_viewmodel.dart';
import 'package:project_pilot/view_models/detail_viewmodel/overview_viewmodel.dart';
import 'package:project_pilot/views/screens/detail/ingredients_screen.dart';
import 'package:project_pilot/views/screens/detail/overview_screen.dart';


class DetailScreen extends StatefulWidget {
  int id;
  DetailScreen(this.id);


  @override
  _DetailScreenState createState() => _DetailScreenState();

}

class _DetailScreenState extends State<DetailScreen> {


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
                  onPressed: () {},
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
          body:
          TabBarView(
            children: [
              OverviewScreen(widget.id),
              IngredientsScreen(),
              InstructionsScreen(),
            ],
          ),
        ));
  }
}
