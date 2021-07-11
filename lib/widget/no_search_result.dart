import 'package:flutter/material.dart';
import 'package:my_share_nepal/reusable/nothing_found.dart';

class NoSearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NothingFound(
      icon: Icons.close,
      title: 'Nothing found!',
      text:
          'Try changing search keyword or fetch new data if keyword is correct.',
    );
  }
}
