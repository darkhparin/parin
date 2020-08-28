import 'package:cwl/constants/route_names.dart';
import 'package:cwl/locator.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  final ApiService _apiService = locator<ApiService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  final String version;

  AppDrawer(this.version);

  Widget getVersionInfoWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Text(
        'Version : $version',
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  Future logout(context) async {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            'Are You Sure ?',
            style: TextStyle(color: Colors.red),
          ),
          content: Text('\nAre You Sure Logout This Application '),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
                _navigationService.navigateReplacementTo(LoginViewRoute);
              },
            ),
            CupertinoDialogAction(
              child: Text('Cancel'),
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
    // var responce = await _dialogService.showConfirmationDialog(
    //   title: 'Are You Sure ?',
    //   description: 'Confirm Logout ?',
    // );

    // if (responce.confirmed) {
    //   _navigationService.navigateReplacementTo(LoginViewRoute);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(_apiService.userdetails?.name),
            accountEmail: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_apiService.userdetails.userType),
                getVersionInfoWidget(),
              ],
            ),
            otherAccountsPictures: <Widget>[
              new CircleAvatar(
                  backgroundColor: Colors.red,
                  child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.powerOff,
                      size: 16.0,
                    ),
                    onPressed: () async => {await logout(context)},
                  ))
            ],
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.user),
                onPressed: () => {},
              ),
            ),
          ),
          getDashBoard(),
          new Divider(),
          _apiService.userdetails.userTypeId == 2
              ? getOrderDrawerList()
              : Container(
                  height: 0,
                  width: 0,
                ),
          new Divider(),
          _apiService.userdetails.userTypeId == 2
              ? getEwayBillDrawerList()
              : Container(
                  height: 0,
                  width: 0,
                ),
          new Divider(),
          _apiService.userdetails.userTypeId == 2
              ? getTripDrawerList()
              : Container(
                  height: 0,
                  width: 0,
                ),
          new Divider(),
        ],
      ),
    );
  }

  Widget getDashBoard() {
    return ListTile(
      title: Text('Dashboard'),
      onTap: () {
        _navigationService.navigateReplacementTo(DashBoardDriverViewRoute);
      },
    );
    // if (_apiService.userdetails.userTypeId == 4) {
    //   return ListTile(
    //     title: Text('Dashboard'),
    //     onTap: () {
    //       _navigationService.navigateReplacementTo(DashBoardDriverViewRoute);
    //     },
    //   );
    // } else {
    //   return ListTile(
    //     title: Text('Dashboard'),
    //     onTap: () {
    //       _navigationService.navigateReplacementTo(HomeViewRoute);
    //     },
    //   );
    // }
  }

  Widget getOrderDrawerList() {
    return ExpansionTile(
      title: Text("Order"),
      children: <Widget>[
        ListTile(
          trailing: Icon(
            FontAwesomeIcons.box,
            color: Colors.red,
          ),
          title: Text('Book Order'),
          onTap: () {
            _navigationService.navigateReplacementTo(BookingViewRoute);
            //Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget getEwayBillDrawerList() {
    return ExpansionTile(
      title: Text("EwayBill"),
      children: <Widget>[
        ListTile(
          trailing: Icon(
            FontAwesomeIcons.clock,
            color: Colors.red,
          ),
          title: Text('Extend EwayBills'),
          onTap: () {
            _navigationService.navigateReplacementTo(ExtendEwayBillViewRoute);
            //Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget getTripDrawerList() {
    return ExpansionTile(
      title: Text("Trip"),
      children: <Widget>[
        ListTile(
          trailing: Icon(
            FontAwesomeIcons.truck,
            color: Colors.blue,
          ),
          title: Text('Trip Create'),
          onTap: () {
            _navigationService.navigateReplacementTo(TripCreateViewRoute);
            //Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
