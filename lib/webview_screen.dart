import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:woo_ah_yeah/main_screen_model.dart';

class WebViewScreen extends StatefulWidget {
  final Vaccin vaccin;

  const WebViewScreen({
    Key? key,
    required this.vaccin,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..loadRequest(Uri.parse(widget.vaccin.vaccinType.siteAddress))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vaccin.description),
      ),
      body: SafeArea(
        child: WebViewWidget(controller: _webViewController),
      ),
    );
  }
}
