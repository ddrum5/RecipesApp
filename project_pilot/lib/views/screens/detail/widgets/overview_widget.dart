import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:project_pilot/constant/custom_color.dart';
import 'package:project_pilot/view_models/detail_viewmodel/overview_viewmodel.dart';

class OverviewWidget extends StatefulWidget {
  OverviewViewModel overviewViewModel;

  OverviewWidget(this.overviewViewModel);

  @override
  _OverviewWidgetState createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Stack(
      children: [
        Image.network(
          widget.overviewViewModel.liveData.value.image.toString(),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.8,
          fit: BoxFit.cover,
        ),
        Positioned(
            right: 5,
            bottom: 5,
            child: Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.favorite, size: 24, color: Colors.white),
                    Text(
                      widget.overviewViewModel.liveData.value.aggregateLikes
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
                      widget.overviewViewModel.liveData.value.readyInMinutes
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
        widget.overviewViewModel.liveData.value.title.toString(),
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
                        .overviewViewModel.liveData.value.vegan as bool),
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
                        .liveData
                        .value
                        .vegetarian as bool),
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
                        .liveData
                        .value
                        .dairyFree as bool),
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
                        .liveData
                        .value
                        .glutenFree as bool),
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
                        .liveData
                        .value
                        .veryHealthy as bool),
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
                        .overviewViewModel.liveData.value.cheap as bool),
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
        style: TextStyle(fontSize: 12, color: CustomColor.iconGray),
      ),
    ),
    Container(
      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Html(
        data: widget.overviewViewModel.liveData.value.summary.toString(),
        style:  {
          "*": Style(
              color: CustomColor.grayDark,
              fontSize: FontSize(16),
              fontFamily: "Roboto-Regular",
              margin: EdgeInsets.all(0))
        },

      ),
    ),
    Padding(padding: EdgeInsets.all(10))
      ],
    );
  }
}
