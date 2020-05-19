import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Hea extends StatefulWidget {
  @override
  _HeaPageState createState() => _HeaPageState();
}

class _HeaPageState extends State<Hea> {
  List hea;
  Future<List<dynamic>> fetchData() async {
    http.Response response = await http.get(
        'http://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=17141852308c45f9813b14ce49f70996');
    setState(() {
      hea = json.decode(response.body)['articles'];
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
      body: hea == null
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
                                      hea[index]['publishedAt'].toString(),
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  'Source:- ' + hea[index]['author'].toString(),
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
                              child: hea[index]['urlToImage'] == null
                                  ? Text('No image')
                                  : Image.network(
                                      hea[index]['urlToImage'],
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(20),
                              height: 87,
                              color: Colors.black12,
                              child: Text(
                                'Headline : ' + hea[index]['title'].toString(),
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
                                'Story: ' + hea[index]['description'].toString(),
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
              itemCount: hea == null ? 0 : hea.length,
            ),
    );
  }
}
