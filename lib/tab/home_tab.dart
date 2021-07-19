import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/symbols/fetch_symbols_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/helper/utilities.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          MaterialButton(
            color: Theme.of(context).primaryColorLight,
            textColor: Colors.white,
            child: Text('fetch'),
            onPressed: () async {
              context.read<FetchSymbolsCubit>().fetchSymbols();
            },
          ),
          MaterialButton(
            color: Theme.of(context).primaryColorLight,
            textColor: Colors.white,
            child: Text('show snack bar'),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(normalSnackBar(
                context: context,
                content:
                    'This is test message This text message is very long and i don\'t think this will fit in the content. By the way long message should be avoided as possible.',
              ));
            },
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
        ],
      ),
    );
  }
}
