import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Website extends StatelessWidget {
  final String web = 'https://thandrisannidhiministries.in/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(web)),
        ),
      ),
    );
  }
}
