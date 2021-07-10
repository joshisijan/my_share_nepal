import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/symbols_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Theme.of(context).primaryColorDark,
      child: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          MaterialButton(
            color: Theme.of(context).primaryColorLight,
            textColor: Colors.white,
            child: Text('fetch'),
            onPressed: () {
              context.read<SymbolsCubit>().fetchSymbols();
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
