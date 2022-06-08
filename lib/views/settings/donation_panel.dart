import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Divider(),
            Text(
              "This app completely ad-free\nIf you enjoy the app please consider donating:",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            RichText(
              text: TextSpan(
                text: "PayPal me",
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchUrl(
                      Uri(path: 'https://www.paypal.com/paypalme/LUKEx76')),
              ),
            ),
            Text(
              "Cheers!!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              "🎈🎂🐦",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
