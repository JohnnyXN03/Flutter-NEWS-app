import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(Descr(null));

class Descr extends StatelessWidget {
  final String urlnew;
  Descr(this.urlnew);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff273C75),
        title: Text(
          'Full Story',
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Color(0xff273C75),
      body: WebviewScaffold(url: urlnew) == null
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: WebviewScaffold(url: urlnew),
            ),
    );
  }
}
