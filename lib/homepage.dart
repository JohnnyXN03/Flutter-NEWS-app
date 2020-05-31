import 'package:flutter/material.dart';
import 'package:newsx/health.dart';
import 'package:newsx/social.dart';
import './dashboard.dart';
import './sports.dart';
import './social.dart';
import './sci.dart';
import './tech.dart';
import './health.dart';
import './business.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            elevation: 2,
            backgroundColor: Color(0xff273C75),
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              labelPadding: EdgeInsets.all(10),
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  textBaseline: TextBaseline.ideographic),
              tabs: [
                Tab(
                  text: 'Top',
                ),
                Tab(text: 'Sports'),
                Tab(text: 'Social'),
                Tab(
                  text: 'Business',
                ),
                Tab(text: 'Science'),
                Tab(text: 'Tech'),
                Tab(text: 'Health'),
              ],
            ),
            title: Text(
              'News Tw',
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          body: TabBarView(children: [
            IndiaPage(),
            Sports(),
            Social(),
            Busi(),
            Sci(),
            Tech(),
            Hea(),
          ]),
        ),
      ),
    );
  }
}
