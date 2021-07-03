import 'package:flutter/material.dart';
import 'package:my_share_nepal/app.dart';

void main() {
  runApp(AppBase());
}

class AppBase extends StatelessWidget {
  const AppBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
