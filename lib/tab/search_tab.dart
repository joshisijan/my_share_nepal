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
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Container(
            color: Theme.of(context).primaryColorLight.withAlpha(50),
            child: TextButton.icon(
              icon: Icon(Icons.search),
              label: Text('Search...'),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchPage(
                    searchIndex: 0,
                  ),
                );
              },
            ),
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
