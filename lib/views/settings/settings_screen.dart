import 'package:flutter/material.dart';
import 'package:happy_bird_day/views/settings/donation_panel.dart';
import 'package:happy_bird_day/views/settings/settings_list.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🐦 🎂 🐦"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SettingsList(),
          DonationPanel(),
        ],
      ),
    );
  }
}
