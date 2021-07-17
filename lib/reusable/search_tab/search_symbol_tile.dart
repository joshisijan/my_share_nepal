import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:my_share_nepal/reusable/custom_popup_menu_button.dart';
import 'package:my_share_nepal/reusable/text_icon_button.dart';
import 'package:my_share_nepal/screen/symbol_detail_page.dart';

class SearchSymbolTile extends StatelessWidget {
  final SymbolModel? symbolModel;
  final int searchIndex;
  final Function() onAdd;
  final Function() onCompare;
  SearchSymbolTile({
    required this.symbolModel,
    this.searchIndex = 0,
    required this.onAdd,
    required this.onCompare,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(
            vertical: kHalfPadding,
            horizontal: kDefaultPadding,
          ),
          title: Text(
            symbolModel!.symbol,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          trailing: Builder(
            builder: (context) {
              if (searchIndex == 0) {
                return CustomPopupMenuButton(
                  onSelected: (value) {
                    if (value == 0) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => SymbolDetailPage(
                          symbolModel: symbolModel,
                        ),
                      ));
                    } else {
                      onAdd.call();
                    }
                  },
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: 0,
                        child: ListTile(
                          dense: true,
                          leading: Icon(Icons.feed),
                          title: Text('View details'),
                        ),
                      ),
                      PopupMenuItem(
                        value: 1,
                        child: ListTile(
                          dense: true,
                          leading: Icon(Icons.add),
                          title: Text('Add to portfolio'),
                        ),
                      ),
                    ];
                  },
                );
              } else if (searchIndex == 1) {
                return IconTextButton(
                  icon: Icons.add,
                  label: 'Add',
                  onPressed: onAdd,
                );
              } else {
                return IconTextButton(
                  icon: Icons.add,
                  label: 'Compare',
                  onPressed: onCompare,
                );
              }
            },
          ),
        ),
        Divider(
          height: 0.0,
        ),
      ],
    );
  }
}
