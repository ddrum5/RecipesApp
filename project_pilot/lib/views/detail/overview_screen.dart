import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/ViewModels/detail/details_viewmodel.dart';
import 'package:project_pilot/views/detail/widgets/overview_widget.dart';

class OverviewScreen extends StatefulWidget {
  final DetailsViewModel _detailsViewModel;
  OverviewScreen(this._detailsViewModel);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: StreamBuilder(
        stream: widget._detailsViewModel.streamOverView,
        builder: (context, AsyncSnapshot<Object?> snapshot) {
          if (snapshot.hasData) {
            return OverviewWidget(widget._detailsViewModel);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
