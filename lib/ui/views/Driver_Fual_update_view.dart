import 'package:cwl/common/DocketSearch.dart';
import 'package:cwl/common/RateCalc.dart';
import 'package:cwl/common/DocketSearch.dart';
import 'package:cwl/models/application/commonmodel.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/drawer.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/guest_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:cwl/constants/route_names.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/locator.dart';

import 'guest_view.dart';

class FualUpdateView extends StatelessWidget {
  const FualUpdateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    return ViewModelProvider<GuestViewModel>.withConsumer(
      viewModelBuilder: () => GuestViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Fuel Update',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[500],
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => GuestView(),
                  )),
            ),
          ],
        ),
        drawer: AppDrawer(model.appVersion),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  'http://media.zenfs.com/en-IN/homerun/international_business_times_248/2cee111b3fca14d701327cb343f0fdff',
                ),
                verticalSpaceMedium,
                Text('Select Pump'),
                Container(
                  child: new DropdownButton<Commonmodel>(
                    hint: Text('Select Fuel Pump'),
                    isExpanded: true,
                    style: TextStyle(color: Colors.deepPurple),
                    onChanged: (Commonmodel value) {},
                  ),
                ),
                verticalSpaceMedium,
                Text('Fuel Ammount'),
                InputField(
                  placeholder: 'Fuel Ammount',
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: null,
                  onChanged: (text) {},
                ),
                Text('Fuel in Litres'),
                InputField(
                  placeholder: 'Fuel in Litres',
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: null,
                  onChanged: (text) {},
                ),
                verticalSpaceMedium,
                getImagePicker(),
                verticalSpaceMedium,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: BusyButton(
                      title: 'Fuel Update In Trip',
                      busy: model.busy,
                      onPressed: () async {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getImagePicker() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          new BoxShadow(
            color: Colors.blue,
            blurRadius: 8.0,
          ),
        ],
      ),
      height: 200,
      width: double.infinity,
      child: InkWell(
        child: Card(
          child: Center(
            child: Icon(
              Icons.add_a_photo,
              size: 70,
              color: Colors.blue,
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
