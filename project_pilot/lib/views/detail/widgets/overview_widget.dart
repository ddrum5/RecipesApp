import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/ViewModels/detail/details_viewmodel.dart';

class OverviewWidget extends StatefulWidget {
  final DetailsViewModel overviewViewModel;

  OverviewWidget(this.overviewViewModel);

  @override
  _OverviewWidgetState createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Stack(
        children: [
          Image.network(
            widget.overviewViewModel.streamOverView.value.image.toString(),
            width: MediaQuery.of(context).size.width,
            height: 240,
            fit: BoxFit.cover,
          ),
          Positioned(
              right: 5,
              bottom: 5,
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.favorite, size: 24, color: Colors.white,),
                      Text(
                        widget.overviewViewModel.streamOverView.value.aggregateLikes
                            .toString(),
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(right: 16)),
                  Column(
                    children: [
                      Icon(Icons.watch_later_outlined,
                          size: 24, color: Colors.white),
                      Text(
                        widget.overviewViewModel.streamOverView.value.readyInMinutes
                            .toString(),
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
      Container(
        padding: EdgeInsets.only(top: 24, left: 16),
        child: Text(
          widget.overviewViewModel.streamOverView.value.title.toString(),
          style: TextStyle(fontSize: 25),
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 16, left: 16, right: 67),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: CustomColor.isDisableColor(widget
                          .overviewViewModel.streamOverView.value.vegan ?? false),
                      size: 20,
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Text("Vegan", style: TextStyle(fontSize: 14))
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 12)),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: CustomColor.isDisableColor(widget
                          .overviewViewModel
                          .streamOverView
                          .value
                          .vegetarian ?? false),
                      size: 20,
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Text("Vegetarian", style: TextStyle(fontSize: 14))
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: CustomColor.isDisableColor(widget
                          .overviewViewModel
                          .streamOverView
                          .value
                          .dairyFree ?? false),
                      size: 20,
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Text("Dairy Free", style: TextStyle(fontSize: 14))
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 12)),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: CustomColor.isDisableColor(widget
                          .overviewViewModel
                          .streamOverView
                          .value
                          .glutenFree ?? false),
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Text("Gluten Free", style: TextStyle(fontSize: 14))
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 20,
                      color: CustomColor.isDisableColor(widget
                          .overviewViewModel
                          .streamOverView
                          .value
                          .veryHealthy?? false),
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Text("Healthy", style: TextStyle(fontSize: 14))
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 12)),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: CustomColor.isDisableColor(widget
                          .overviewViewModel.streamOverView.value.cheap ?? false),
                      size: 20,
                    ),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Text("Cheap", style: TextStyle(fontSize: 14))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Text(
          "Description",
          style: TextStyle(fontSize: 12, color: CustomColor.gray),
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 8, left: 16, right: 16),
        child: Html(
          data: widget.overviewViewModel.streamOverView.value.summary.toString(),
          style:  {
            "*": Style(
                color: CustomColor.grayDark,
                fontSize: FontSize(16),
                fontFamily: "robotoRegular",
                margin: EdgeInsets.all(0))
          },

        ),
      ),
      Padding(padding: EdgeInsets.all(10))
        ],
      ),
    );
  }
}
