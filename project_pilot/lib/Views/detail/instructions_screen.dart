import 'package:flutter/material.dart';
import 'package:project_pilot/Views/widgets/data_empty_widget.dart';
import 'package:project_pilot/Helper/configs/custom_colors.dart';
import 'package:project_pilot/models/instruction_model.dart';
import 'package:project_pilot/ViewModels/details_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InstructionsScreen extends StatefulWidget {
  final DetailsViewModel _detailsViewModel;

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
        if (snapshot.connectionState != ConnectionState.active) {
          return Center(
            child: Container(
              color: Colors.white,
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (!snapshot.hasData) {
            return DataEmptyWidget(AppLocalizations
                .of(context)
                ?.error ?? '');
          } else {
            return ListView.builder(
              itemCount:
              widget._detailsViewModel.streamInstructions.value.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      side: BorderSide(width: 1, color: CustomColors.grayLite)),
                  margin: EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                    Row(
                    children: [
                    Icon(
                    Icons.check_circle,
                      color: CustomColors.green,
                      size: 20,
                    ),
                    Padding(padding: EdgeInsets.only(right: 16)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${AppLocalizations
                              .of(context)
                              ?.step} ${index + 1}',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                              fontSize: 12)
                        ),
                        Text(
                          "Lorem Ipsum",
                          style: TextStyle(
                              fontSize: 25, color: CustomColors.green),
                        ),
                      ],
                    ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 16)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          widget._detailsViewModel.streamInstructions
                              .value[index].step,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                              fontSize: 1))
                )],
                )
                ,
                )
                ,
                );
              },
            );
          }
        }
      },
    );
  }
}
