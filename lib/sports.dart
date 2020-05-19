import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Sports extends StatefulWidget {
  @override
  _SportsPageState createState() => _SportsPageState();
}

class _SportsPageState extends State<Sports> {
  List spt;
  Future<List<dynamic>> fetchData() async {
    http.Response response = await http.get(
        'http://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=17141852308c45f9813b14ce49f70996');
    setState(() {
      spt = json.decode(response.body)['articles'];
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
      body: spt == null
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange[300],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.all(15),
                  color: Colors.white,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    height: 330,
                    child: Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Time : ' +
                                      spt[index]['publishedAt'].toString(),
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  'Source:- ' + spt[index]['author'].toString(),
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Container(
                              height: 100,
                              padding: EdgeInsets.all(10),
                              child: spt[index]['urlToImage'] == null
                                  ? Text('No image')
                                  : Image.network(
                                      spt[index]['urlToImage'],
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(20),
                              height: 87,
                              color: Colors.black12,
                              child: Text(
                                'Headline : ' + spt[index]['title'].toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Divider(),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                'Story: ' + spt[index]['description'].toString(),
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ]),
                  ),
                );
              },
              itemCount: spt == null ? 0 : spt.length,
            ),
    );
  }
}
