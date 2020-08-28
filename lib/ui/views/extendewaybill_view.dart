import 'package:cwl/models/masterindex.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/drawer.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/extendewaybill_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider_architecture/provider_architecture.dart';

import 'guest_view.dart';

class ExtendEwayBillView extends StatelessWidget {
  final vehcleController = TextEditingController();
  final remainingDistnaceController = TextEditingController();
  final remarkController = TextEditingController();

  Widget showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _settingModalBottomSheet(
      context, ExtendEwayBillViewModel model, Extendableewaybill waybill) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: new Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'EwayBill No : ${waybill.ewbNo}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  verticalSpaceSmall,
                  Text(
                    'Extend Validity Reason',
                  ),
                  Container(
                    height: 50,
                    child: new DropdownButton<String>(
                      value: model.validReason,
                      hint: Text('Select Valid Reason'),
                      style: TextStyle(color: Colors.deepPurple),
                      items: model.validReasons
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        model.setvalidReason(value);
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Vehicle No',
                    controller: vehcleController,
                    textInputAction: TextInputAction.next,
                    validationMessage: model.errormsg,
                    onChanged: (value) {
                      model.setvehicleNo(value);
                    },
                  ),
                  InputField(
                    placeholder: 'Remaining Distance',
                    controller: remainingDistnaceController,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      model.setremainingDistance(value);
                    },
                  ),
                  InputField(
                    placeholder: 'Extend Remark',
                    controller: remarkController,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      model.setextendRemark(value);
                    },
                  ),
                  verticalSpaceSmall,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BusyButton(
                        title: 'Extend',
                        busy: model.busy,
                        onPressed: () {
                          model.extendEwayBill();
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ExtendEwayBillViewModel>.withConsumer(
      viewModel: ExtendEwayBillViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Extend EwayBills  Count :${model.ewayBills.length}'),
           actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.home,),
              onPressed: ()  => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GuestView(),)),
            ),
          ],
        ),
        drawer: AppDrawer(model.appVersion),
        backgroundColor: Colors.white,
        body: new ListView.builder(
          itemCount: model.ewayBills.length,
          itemBuilder: (BuildContext ctxt, int idx) {
            return Card(
              child: ListTile(
                trailing: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.clock,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    model.setewayBillNo(model.ewayBills[idx].ewbNo);
                    _settingModalBottomSheet(
                        context, model, model.ewayBills[idx]);
                  },
                ),
                title: Text(
                    '${model.ewayBills[idx].docketNo} (${model.ewayBills[idx].status})'),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    verticalSpaceTiny,
                    Text('EwayBill No : ${model.ewayBills[idx].ewbNo}'),
                    verticalSpaceTiny,
                    Text('Created On : ${model.ewayBills[idx].createdOn}'),
                    verticalSpaceTiny,
                    Text('Valid Till : ${model.ewayBills[idx].validTill}'),
                    verticalSpaceTiny,
                    Text(
                      'Expire In : ${model.ewayBills[idx].expireIn} (hrs)',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    verticalSpaceTiny,
                    Text(
                        'Valid Days : ${model.ewayBills[idx].validDays}  Extended Times : ${model.ewayBills[idx].extendedTimes}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
