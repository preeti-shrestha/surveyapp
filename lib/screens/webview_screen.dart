import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebviewScreen extends StatefulWidget {

  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  WebViewController controller=WebViewController();
  @override
  void initState() {
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse('https://forms.gle/ueB2ivz6imiJ7jTn8'));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Form'),
      ),
      body: WebViewWidget(controller: controller),
    );
    // https://forms.gle/ueB2ivz6imiJ7jTn8
  }
}

