import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IndiaPage extends StatefulWidget {
  @override
  _IndiaPageState createState() => _IndiaPageState();
}

class _IndiaPageState extends State<IndiaPage> {
  List india = [];
  List topnews = [];
  Future<List<dynamic>> fetchData() async {
    http.Response response = await http.get(
        'http://newsapi.org/v2/top-headlines?country=in&apiKey=17141852308c45f9813b14ce49f70996');
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
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Highlights',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 300,
              child: ListView.builder(
                  itemCount: topnews.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      hoverColor: Colors.transparent,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                        padding: EdgeInsets.all(5),
                        child: SizedBox(
                          height: 300,
                          width: 400,
                          child: Card(
                            margin: EdgeInsets.all(10),
                            elevation: 10,
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: <Widget>[
                                Container(
                                  child: topnews[index]['urlToImage'] == null
                                      ? Text('No image')
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
          ),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.topLeft,
            child: Text(
              'Top Headlines',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 320,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    child: Card(
                      elevation: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                            width: 140,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              child: india[index]['urlToImage'] == null
                                  ? Text('No image')
                                  : Image.network(
                                      india[index]['urlToImage'],
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            height: 100,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '' + india[index]['title'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: india.length == null ? 0 : india.length,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
