import 'package:flutter/material.dart';
import 'package:prabasi_anchalika_sangha/screen/homescreen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UrlLunchWebView extends StatefulWidget {
  UrlLunchWebView({Key? key, this.url}) : super(key: key);
  String? url;

  @override
  State<UrlLunchWebView> createState() => _UrlLunchWebViewState();
}

class _UrlLunchWebViewState extends State<UrlLunchWebView> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse("'https://www.google.com/'"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context);
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeWidget(),
                    ));
              },
              icon: Icon(Icons.close))
        ],
      ),
      body: SafeArea(
          child: Expanded(child: WebViewWidget(controller: controller))),
    );
  }
}
