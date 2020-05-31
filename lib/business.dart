import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'descr.dart';
import 'package:flutter_share_me/flutter_share_me.dart';

class Busi extends StatefulWidget {
  @override
  _BusiPageState createState() => _BusiPageState();
}

class _BusiPageState extends State<Busi> {
  List busi;
  Future<List<dynamic>> fetchData() async {
    http.Response response = await http.get(
        'http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=17141852308c45f9813b14ce49f70996');
    setState(() {
      busi = json.decode(response.body)['articles'];
    });
  }

  fetchtData() async {
    fetchData();
    print('fetch data');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: busi == null
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  child: InkWell(
                    onTap: () {
                      var url1 = busi[index]['url'];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Descr(url1)));
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 80,
                            width: 110,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: busi[index]['urlToImage'] == null
                                  ? Image.asset('assets/newsback.jpg')
                                  : Image.network(
                                      busi[index]['urlToImage'],
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            height: 100,
                            child: Container(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                '' + busi[index]['title'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.share,
                                size: 20,
                              ),
                              onPressed: ()async {
                                FlutterShareMe().shareToWhatsApp(
                                            msg:
                                                'Shared Through Tanwave News App. ' +
                                                    busi[index]['url']);
                              })
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: busi.length == null ? 0 : busi.length,
            ),
    );
  }
}
