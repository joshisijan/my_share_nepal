import 'package:flutter/material.dart';
import 'package:my_share_nepal/reusable/nothing_found.dart';

class NoPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NothingFound(
      icon: Icons.close,
      title: 'Nothing in portfolio!',
      text: 'Add to Portfolio by add button below.',
    );
  }
}
