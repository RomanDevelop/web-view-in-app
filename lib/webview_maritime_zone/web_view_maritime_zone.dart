import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewMaritimeZone extends StatefulWidget {
  @override
  _WebViewMaritimeZoneState createState() => _WebViewMaritimeZoneState();
}

class _WebViewMaritimeZoneState extends State<WebViewMaritimeZone> {
  late InAppWebViewController controller;
  final String allowedUrl = 'https://maritime-zone.com/en/vacancy';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maritime Zone')),
      body: InAppWebView(
        initialUrlRequest:
            URLRequest(url: WebUri(allowedUrl)), // Используем WebUri
        onWebViewCreated: (InAppWebViewController webViewController) {
          controller = webViewController;
        },
        onLoadStart: (InAppWebViewController webViewController, WebUri? url) {
          // Можно использовать для отладки
        },
        onLoadStop:
            (InAppWebViewController webViewController, WebUri? url) async {
          // Можно использовать для обработки после загрузки
        },
        shouldOverrideUrlLoading: (InAppWebViewController webViewController,
            NavigationAction request) async {
          if (request.request.url!.toString().startsWith(allowedUrl)) {
            return NavigationActionPolicy.ALLOW; // Разрешаем навигацию
          } else {
            return NavigationActionPolicy.CANCEL; // Блокируем навигацию
          }
        },
      ),
    );
  }
}
