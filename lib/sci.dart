import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Sci extends StatefulWidget {
  @override
  _SciPageState createState() => _SciPageState();
}

class _SciPageState extends State<Sci> {
  List soi;
  Future<List<dynamic>> fetchData() async {
    http.Response response = await http.get(
        'http://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=17141852308c45f9813b14ce49f70996');
    setState(() {
      soi = json.decode(response.body)['articles'];
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
      body: soi == null
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange[300],
              ),
            )
          : ListView.builder(
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
                            child: soi[index]['urlToImage'] == null
                                ? Text('No image')
                                : Image.network(
                                    soi[index]['urlToImage'],
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
                              '' + soi[index]['title'],
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
              itemCount: soi.length == null ? 0 : soi.length,
            ),
    );
  }
}
