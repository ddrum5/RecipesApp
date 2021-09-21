import 'package:flutter/material.dart';
import 'package:project_pilot/helper/custom_color.dart';
import 'package:project_pilot/models/instruction_model.dart';
import 'package:project_pilot/ViewModels/detail/details_viewmodel.dart';

class InstructionsScreen extends StatefulWidget {
  DetailsViewModel _detailsViewModel;

  InstructionsScreen(this._detailsViewModel);

  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InstructionModel>>(
      stream: widget._detailsViewModel.streamInstructions,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: widget._detailsViewModel.streamInstructions.value.length,
          itemBuilder: (context, index) {
            return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    side: BorderSide(width: 1, color: CustomColor.grayLite)),
                margin: EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: CustomColor.green,
                              size: 20,
                            ),
                            Padding(padding: EdgeInsets.only(right: 16)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Step ${index + 1}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: CustomColor.grayDark),
                                ),
                                Text(
                                  "Lorem Ipsum",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: CustomColor.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 16)),
                        Text(
                            widget._detailsViewModel.streamInstructions
                                    .value[index].step,
                            style: TextStyle(
                                fontSize: 16, color: CustomColor.grayDark))
                      ],
                    )));
          },
        );
      },
    );
  }
}
