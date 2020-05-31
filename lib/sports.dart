import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'descr.dart';

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
                return Container(
                  height: 100,
                  child: InkWell(
                    onTap: () {
                      var url = spt[index]['url'];
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
                              child: spt[index]['urlToImage'] == null
                                  ? Text('No image')
                                  : Image.network(
                                      spt[index]['urlToImage'],
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
                                '' + spt[index]['title'],
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
              itemCount: spt.length == null ? 0 : spt.length,
            ),
    );
  }
}
