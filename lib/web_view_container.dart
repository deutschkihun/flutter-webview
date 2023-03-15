import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainerWidget extends StatefulWidget {
  final url;
  WebViewContainerWidget(this.url);

  @override
  State<WebViewContainerWidget> createState() =>
      _WebViewContainerWidgetState(url);
}

class _WebViewContainerWidgetState extends State<WebViewContainerWidget> {
  final _url;
  _WebViewContainerWidgetState(this._url);

  @override
  Widget build(BuildContext context) {
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
      ..loadRequest(Uri.parse(_url));

    return Scaffold(
        // ignore: prefer_interpolation_to_compose_strings
        appBar: AppBar(title: Text('Flutter webview: ' + _url)),
        body: WebViewWidget(controller: controller));
  }
}
