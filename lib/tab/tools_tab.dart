import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/reusable/tools_card.dart';
import 'package:my_share_nepal/screen/search_page.dart';
import 'package:my_share_nepal/screen/symbol_comparison.dart';

class ToolsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            'Tools',
            style: Theme.of(context).textTheme.headline4,
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
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => SymbolComparisonPage(),
                  ));
                },
              ),
              ToolsCard(
                title: 'Analysis',
                icon: Icons.insights,
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchPage(
                      searchIndex: 3,
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
        ],
      ),
    );
  }
}
