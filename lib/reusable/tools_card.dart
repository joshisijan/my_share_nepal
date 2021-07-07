import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';

class ToolsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;
  ToolsCard({
    required this.title,
    required this.icon,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 30.0,
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      child: MaterialButton(
        onPressed: () {
          onPressed.call();
        },
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.subtitle1!.fontSize,
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}