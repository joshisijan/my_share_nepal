import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';
import 'package:my_share_nepal/reusable/tools_card.dart';

class ToolsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Theme.of(context).primaryColorDark,
      child: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            'Tools',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Wrap(
            children: [
              ToolsCard(
                title: 'Calculator',
                icon: Icons.calculate,
                onPressed: () {},
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              ToolsCard(
                title: 'Comparison',
                icon: Icons.compare_arrows,
                onPressed: () {},
              ),
              ToolsCard(
                title: 'Analysis',
                icon: Icons.insights,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
