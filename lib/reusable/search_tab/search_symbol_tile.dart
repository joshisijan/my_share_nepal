import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:my_share_nepal/reusable/custom_popup_menu_button.dart';
import 'package:my_share_nepal/screen/symbol_detail_page.dart';

class SearchSymbolTile extends StatelessWidget {
  final SymbolModel? symbolModel;
  final int searchIndex;
  final Function() onAdd;
  SearchSymbolTile({
    required this.symbolModel,
    this.searchIndex = 0,
    required this.onAdd,
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
          trailing: searchIndex == 0
              ? CustomPopupMenuButton(
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
                )
              : IconButton(
                  icon: Icon(Icons.add),
                  onPressed: onAdd,
                ),
        ),
        Divider(
          height: 0.0,
        ),
      ],
    );
  }
}
