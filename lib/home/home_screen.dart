import 'package:flutter/material.dart';
import 'package:happy_bird_day/home/birthday_list_view.dart';
import 'package:happy_bird_day/home/calendar_tab_view.dart';
import 'package:happy_bird_day/home/create_birthday_fab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Happy 🐦-Day"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.calendar_today_outlined)),
              Tab(icon: Icon(Icons.calendar_view_day_rounded)),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              CalendarTabView(),
              BirthdayListView(),
            ],
          ),
        ),
        floatingActionButton: CreateBirthdayFAB(),
      ),
    );
  }
}
