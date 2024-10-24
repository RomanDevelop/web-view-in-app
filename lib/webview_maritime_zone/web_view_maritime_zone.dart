import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewMaritimeZone extends StatefulWidget {
  @override
  _WebViewMaritimeZoneState createState() => _WebViewMaritimeZoneState();
}

class _WebViewMaritimeZoneState extends State<WebViewMaritimeZone> {
  late final WebViewController controller;
  final String allowedUrl = 'https://maritime-zone.com/en/vacancy';

  @override
  void initState() {
    super.initState();

    // Инициализация WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          // Ограничиваем навигацию на другие URL
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(allowedUrl)) {
              return NavigationDecision
                  .navigate; // Разрешаем только основной URL
            } else {
              return NavigationDecision
                  .prevent; // Блокируем все остальные переходы
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(allowedUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maritime Zone')),
      body: WebViewWidget(controller: controller),
    );
  }
}
