import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsx/descr.dart';

import 'package:flutter_share_me/flutter_share_me.dart';

class IndiaPage extends StatefulWidget {
  @override
  _IndiaPageState createState() => _IndiaPageState();
}

class _IndiaPageState extends State<IndiaPage> {
  List india = [];
  List topnews = [];

  Future<List<dynamic>> fetchData() async {
    http.Response response = await http.get(
        'http://newsapi.org/v2/top-headlines?country=in&&apiKey=17141852308c45f9813b14ce49f70996');
    setState(() {
      india = json.decode(response.body)['articles'];
    });
  }

  Future<List<dynamic>> fetchDatatop() async {
    http.Response response = await http.get(
        'http://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=17141852308c45f9813b14ce49f70996');
    setState(() {
      topnews = json.decode(response.body)['articles'];
    });
  }

  fetchtData() async {
    fetchData();
    fetchDatatop();
    print('fetch data');
  }

  @override
  void initState() {
    fetchData();
    fetchDatatop();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: topnews.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      var url = topnews[index]['url'];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Descr(url)));
                    },
                    hoverColor: Colors.transparent,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        height: 300,
                        width: 400,
                        child: Card(
                          margin: EdgeInsets.all(10),
                          elevation: 5,
                          child: Stack(
                            fit: StackFit.passthrough,
                            children: <Widget>[
                              Container(
                                child: topnews[index]['urlToImage'] == null
                                    ? Image.asset('assets/newsback.jpg')
                                    : Image.network(
                                        topnews[index]['urlToImage'],
                                        alignment: Alignment.center,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 400,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                    color: Colors.white10,
                                  ),
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    '' + topnews[index]['title'].toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Swipe left for more highlights',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.topLeft,
            child: Text(
              'Top Headlines',
              style: TextStyle(
                fontFamily: 'OpenSans',
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  child: InkWell(
                    onTap: () {
                      var url1 = india[index]['url'];
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
                              child: india[index]['urlToImage'] == null
                                  ? Image.asset('assets/newsback.jpg')
                                  : Image.network(
                                      india[index]['urlToImage'],
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
                                '' + india[index]['title'],
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
                              onPressed: () async {
                                FlutterShareMe().shareToWhatsApp(
                                    msg: 'Shared Through Tanwave News App.  ' +
                                        india[index]['url']);
                              })
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: india.length == null ? 0 : india.length,
            ),
          ),
        ],
      ),
    );
  }
}
