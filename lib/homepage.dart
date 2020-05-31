import 'package:flutter/material.dart';
import 'package:newsx/health.dart';
import 'package:newsx/social.dart';
import './dashboard.dart';
import './sports.dart';
import './social.dart';
import './sci.dart';
import './tech.dart';
import './health.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Color(0xff273C75),
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
                Tab(text: 'Sports'),
                Tab(text: 'Social'),
                Tab(text: 'Scienc'),
                Tab(text: 'Tech'),
                Tab(text: 'Health'),
              ],
            ),
            title: Text('News Tw'),
          ),
          body: TabBarView(children: [
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
