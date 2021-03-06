import 'package:flutter/material.dart';
import 'package:happy_bird_day/models/birthday.dart';
import 'package:happy_bird_day/services/util.dart';
import 'package:happy_bird_day/stlyes.dart';

class BirthdayMonthCard extends StatelessWidget {
  final List<Birthday> birthdays;
  final int monthIndex;

  const BirthdayMonthCard({this.birthdays = const [], this.monthIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.lerp(colorPalette.primaryColor, colorPalette.darkAccentColor,
          (monthIndex + 1) / 13),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Column(
          children: [
            Text(
              monthMap[monthIndex] ?? "",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 2),
            birthdays.length != 0
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 6),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: birthdays.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 120,
                              child: Text(
                                birthdays[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            ),
                            Text(
                              " - " +
                                  dateToDisplayString(birthdays[index].birthDay,
                                      birthdays[index].birthMonth,
                                      delimiter: ".", displayYear: false),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
