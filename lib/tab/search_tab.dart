import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/reusable/nothing_found.dart';
import 'package:my_share_nepal/screen/search_page.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            'Search',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          MaterialButton(
            color: Theme.of(context).primaryColorLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultBorderRadius * 2),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 0.8),
              alignment: Alignment.centerLeft,
              child: Text(
                'Search...',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchPage(
                  searchIndex: 0, //redirects with more option in tile
                ),
              );
            },
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          NothingFound(
            icon: Icons.search,
            title: 'Search symbols',
            text: 'To start search click the search field above.',
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
        ],
      ),
    );
  }
}
