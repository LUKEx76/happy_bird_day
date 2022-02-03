import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Divider(),
            Text(
              "This app does not contain any ads and is completely free",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              "If you enjoy using this app and want to support the creator consider donating:",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            RichText(
              text: TextSpan(
                text: "PayPal me",
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap =
                      () => launch('https://www.paypal.com/paypalme/LUKEx76'),
              ),
            ),
            Text(
              "Cheers!!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              "🎈🎂🐦",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
