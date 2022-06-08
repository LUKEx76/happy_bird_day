import 'package:flutter/material.dart';

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text("Transfer Birthdays (soon)"),
          subtitle: Text(
              "Export your Birthdays to a json File or import a json File"),
          onTap: () => print("Import/Export"),
        ),
        ListTile(
          title: Text("Appearance (soon)"),
          subtitle: Text("Switch between light and dark Theme"),
          onTap: () => print("Theme"),
        ),
      ],
    );
  }
}
