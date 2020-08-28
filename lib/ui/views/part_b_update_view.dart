import 'package:cwl/models/params/partbupdateparam.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/part_b_update_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class PartBUpdateView extends StatelessWidget {
  final vehicleController = TextEditingController();
  final ParamPartBUpdate param;
  PartBUpdateView({this.param, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PartBUpdateViewModel>.withConsumer(
      viewModel: PartBUpdateViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(param),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Update Part B'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop('false'),
          ),
        ),
        backgroundColor: Colors.white,
        body: model.busy ? showLoading() : getBody(context, model),
      ),
    );
  }

  Widget showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getBody(BuildContext context, PartBUpdateViewModel model) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'Docket No : ${model.docket}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: InputField(
                  placeholder: 'Vehicle No',
                  controller: vehicleController,
                  textInputType: TextInputType.text,
                  onChanged: (text) {
                    model.setvehicleNo(text);
                  },
                ),
              ),
              getPartBitems(context, model),
              verticalSpaceMedium,
              BusyButton(
                  title: 'Update Part B',
                  busy: model.busy,
                  onPressed: () {
                    model.updatePartB();
                  }),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }

  Widget getPartBitems(context, PartBUpdateViewModel model) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: model.partBItems.length,
            itemBuilder: (BuildContext ctxt, int idx) {
              return Card(
                child: ListTile(
                  title: Text('EwayBill : ${model.partBItems[idx].ewayBill}'),
                  subtitle: model.partBItems[idx].isProcessing
                      ? CircularProgressIndicator()
                      : Text('Status : ${model.partBItems[idx].status}'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
