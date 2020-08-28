import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/ui/shared/ui_helpers.dart';
import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../locator.dart';

class UpdateView extends StatelessWidget {
  const UpdateView({Key key}) : super(key: key);

  Future _downloadUpdate() async {
    const url =
        'https://play.google.com/store/apps/details?id=cwl.android.logistics';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      await locator<DialogService>().showDialog(
        title: 'Error',
        description: 'Unable to open url !',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.network(
                "https://www.gstatic.com/android/market_images/web/play_prism_hlock_2x.png"),
            SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  'New Update Awailable ',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.red[800],
                  ),
                ),
              ),
            ),
            Image.asset('assets/images/logo.png'),
            verticalSpaceMedium,
            verticalSpaceMedium,
            BusyButton(
              title: 'Download Update',
              busy: false,
              onPressed: _downloadUpdate,
            )
          ],
        ),
      ),
    ));
  }
}
