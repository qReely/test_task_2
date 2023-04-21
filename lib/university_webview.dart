import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class UniversityWebView extends StatefulWidget {
  String url;
  String name;

  UniversityWebView({Key? key, required this.url, required this.name})
      : super(key: key);

  @override
  State<UniversityWebView> createState() => _UniversityWebViewState();
}

class _UniversityWebViewState extends State<UniversityWebView> {
  InAppWebViewController? controller;
  PullToRefreshController? refreshController;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: InAppWebView(
          initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(
              safeBrowsingEnabled: false,
            ),
          ),
          onWebViewCreated: (webController) => controller = webController,
          initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
          onLoadStart: (InAppWebViewController controller, Uri? url) {

          },
          onLoadStop: (InAppWebViewController controller, Uri? url) {

          },
          onReceivedServerTrustAuthRequest: (InAppWebViewController controller, URLAuthenticationChallenge challenge) async {
            return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
          },
        ));
  }
}
