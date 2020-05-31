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
        title: Text(
          'Full Story',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Color(0xff273C75),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebviewScaffold(url: urlnew),
      ),
    );
  }
}
