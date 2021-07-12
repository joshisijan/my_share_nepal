import 'package:flutter/material.dart';
import 'package:my_share_nepal/reusable/nothing_found.dart';

class NoRecentSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NothingFound(
      icon: Icons.close,
      title: 'No recent search!',
      text: 'Try searching for something first.',
    );
  }
}
