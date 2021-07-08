import 'package:flutter/material.dart';
import 'package:my_share_nepal/constants.dart';
import 'package:my_share_nepal/reusable/symbol_tab.dart';

class PortfolioTodayTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kDefaultPadding * 2,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.arrow_upward,
              size: Theme.of(context).textTheme.headline4!.fontSize,
              color: Colors.green,
            ),
            Text(
              '2.80%',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.green,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: kDefaultPadding * 2,
        ),
        SymbolTab(
          symbol: 'NIFRA',
        ),
        SymbolTab(
          symbol: 'HBN',
        ),
        SymbolTab(
          symbol: 'JLI',
        ),
        SymbolTab(
          symbol: 'RLI',
        ),
        SymbolTab(
          symbol: 'UNL',
        ),
        SymbolTab(
          symbol: 'PTT',
        ),
        SymbolTab(
          symbol: 'BLR',
        ),
        SymbolTab(
          symbol: 'MAR',
        ),
        SymbolTab(
          symbol: 'UNIAR64',
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(
          height: kDefaultPadding * 2,
        ),
      ],
    );
  }
}
