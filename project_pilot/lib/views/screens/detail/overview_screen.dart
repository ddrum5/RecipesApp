import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_pilot/view_models/detail_viewmodel/overview_viewmodel.dart';
import 'package:project_pilot/views/screens/detail/widgets/overview_widget.dart';

class OverviewScreen extends StatefulWidget {
  OverviewViewModel overviewViewModel = OverviewViewModel.getInstance();
  final int id;

  OverviewScreen(this.id);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.overviewViewModel.getData(widget.id);
  }


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: StreamBuilder(
        stream: widget.overviewViewModel.liveData,
        builder: (context, AsyncSnapshot<Object?> snapshot) {
          if (snapshot.hasData) {
            return OverviewWidget(widget.overviewViewModel);
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
