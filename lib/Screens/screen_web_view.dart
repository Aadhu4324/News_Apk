import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScreenWebView extends StatelessWidget {
  final String url;
  const ScreenWebView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: WebViewWidget(
              controller: WebViewController()
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
                ..loadRequest(Uri.parse(url)))),
    );
  }
}
