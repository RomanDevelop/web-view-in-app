import 'package:flutter/material.dart';
import 'package:webview_in_app/webview_maritime_zone/web_view_maritime_zone.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maritime Zone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewMaritimeZone(),
    );
  }
}
