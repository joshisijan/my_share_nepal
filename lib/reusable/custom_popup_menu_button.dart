import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final Function(dynamic)? onSelected;
  CustomPopupMenuButton({
    required this.itemBuilder,
    required this.onSelected,
  });
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      icon: Icon(Icons.more_vert),
      onSelected: onSelected,
      itemBuilder: itemBuilder,
    );
  }
}
