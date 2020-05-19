import 'package:flutter/material.dart';
import 'package:newsx/health.dart';
import 'package:newsx/social.dart';
import './topheadline.dart';
import './india.dart';
import './sports.dart';
import './social.dart';
import './sci.dart';
import './tech.dart';
import './health.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.teal,
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              indicatorColor: Colors.redAccent,
              labelPadding: EdgeInsets.all(10),
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  textBaseline: TextBaseline.ideographic),
          
              tabs: [
                Tab(
                  text: 'Top',
                ),
                Tab(
                  text: 'India',
                ),
                Tab(text: 'Sports'),
                Tab(text: 'Social'),
                Tab(text: 'Science'),
                Tab(text: 'Tech'),
                Tab(text: 'Health'),
              ],
            ),
            title: Text('NewsX'),
          ),
          body: TabBarView(children: [
            TopHeadlinePage(),
            IndiaPage(),
            Sports(),
            Social(),
            Sci(),
            Tech(),
            Hea(),
          ]),
        ),
      ),
    );
  }
}
