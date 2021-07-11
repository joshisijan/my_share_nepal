import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

import 'nothing_found.dart';

class BigError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NothingFound(
      isError: true,
      icon: Icons.error,
      title: 'An Error Occurred!',
      text: 'Try again later!',
    );
  }
}
