import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Social extends StatefulWidget {
  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<Social> {
  List so;
  Future<List<dynamic>> fetchData() async {
    http.Response response = await http.get(
        'http://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=17141852308c45f9813b14ce49f70996');
    setState(() {
      so = json.decode(response.body)['articles'];
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
      body: so == null
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
                            child: so[index]['urlToImage'] == null
                                ? Text('No image')
                                : Image.network(
                                    so[index]['urlToImage'],
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
                              '' + so[index]['title'],
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
              itemCount: so.length == null ? 0 : so.length,
            ),
    );
  }
}
