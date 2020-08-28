import 'package:flutter/material.dart';

import 'const.dart';
import 'login.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData(
        primaryColor: themeColor,
      ),
      home: LoginScreen(title: 'CWL Chat - Massaging'),
      debugShowCheckedModeBanner: false,
    );
  }
}
