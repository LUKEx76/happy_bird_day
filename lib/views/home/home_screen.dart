import 'package:flutter/material.dart';
import 'package:happy_bird_day/views/home/birthday_list/birthday_list_view.dart';
import 'package:happy_bird_day/views/home/calendar_tab_view.dart';
import 'package:happy_bird_day/views/home/create_birthday_fab.dart';
import 'package:happy_bird_day/views/settings/settings_screen.dart';

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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Happy 🐦-Day"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).unselectedWidgetColor,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              ),
            ),
          ],
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
