import 'package:flutter/material.dart';

import 'nothing_found.dart';

class BigError extends StatelessWidget {
  final Function()? onReload;
  BigError({
    this.onReload,
  });
  @override
  Widget build(BuildContext context) {
    return NothingFound(
      isError: true,
      icon: Icons.error,
      title: 'An Error Occurred!',
      text: 'Try again later!',
      onReload: onReload,
    );
  }
}
