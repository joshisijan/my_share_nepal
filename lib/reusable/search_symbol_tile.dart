import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/reusable/custom_button.dart';
import 'package:my_share_nepal/reusable/custom_popup_menu_item.dart';

class SearchSymbolTile extends StatelessWidget {
  final String title;
  final Function() onAdd;
  final int searchIndex;
  SearchSymbolTile({
    required this.title,
    required this.onAdd,
    this.searchIndex = 0,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Theme.of(context).primaryColorLight,
          height: 0.0,
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: kDefaultPadding * 2,
            right: kDefaultPadding,
            bottom: kDefaultPadding / 2,
            top: kDefaultPadding / 2,
          ),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(150),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              searchIndex == 0
                  ? PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withAlpha(150),
                      ),
                      color: Theme.of(context).primaryColorLight,
                      onSelected: (value) {
                        if (value == 0) {
                        } else {
                          onAdd.call();
                        }
                      },
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: 0,
                            child: CustomPopupMenuItem(
                              icon: Icons.feed,
                              title: 'View details',
                            ),
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: CustomPopupMenuItem(
                              icon: Icons.add,
                              title: 'Add to portfolio',
                            ),
                          ),
                        ];
                      },
                    )
                  : CustomButton(
                      isIconButton: true,
                      icon: Icons.add,
                      onPressed: onAdd,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
