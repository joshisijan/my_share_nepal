import 'package:flutter/material.dart';

import 'nothing_found.dart';

class BigError extends StatelessWidget {
  final Function()? onReload;
  final bool noTopPadding;
  BigError({
    this.onReload,
    this.noTopPadding = false,
  });
  @override
  Widget build(BuildContext context) {
    return NothingFound(
      isError: true,
      noTopPadding: noTopPadding,
      icon: Icons.error,
      title: 'An Error Occurred!',
      text: 'Try again later!',
      onReload: onReload,
    );
  }
}
