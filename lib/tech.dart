import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'descr.dart';

class Tech extends StatefulWidget {
  @override
  _TechPageState createState() => _TechPageState();
}

class _TechPageState extends State<Tech> {
  List tec;
  Future<List<dynamic>> fetchData() async {
    http.Response response = await http.get(
        'http://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=17141852308c45f9813b14ce49f70996');
    setState(() {
      tec = json.decode(response.body)['articles'];
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
      body: tec == null
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange[300],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  child: InkWell(
                    onTap: () {
                      var url = tec[index]['url'];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Descr(url)));
                    },
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
                              child: tec[index]['urlToImage'] == null
                                  ? Text('No image')
                                  : Image.network(
                                      tec[index]['urlToImage'],
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          SizedBox(
                            width: 240,
                            height: 100,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '' + tec[index]['title'],
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
                  ),
                );
              },
              itemCount: tec.length == null ? 0 : tec.length,
            ),
    );
  }
}
