import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/fetch_symbols_cubit.dart';
import 'package:my_share_nepal/reusable/small_bottom_notification.dart';

class BottomFetchingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSymbolsCubit, FetchSymbolsState>(
      builder: (context, symbolsState) {
        if (symbolsState is SymbolsFetchLoading) {
          return SmallBottomNotification(
            title: 'Fetching latest data',
          );
        } else if (symbolsState is SymbolsFetchError) {
          return SmallBottomNotification(
            title: 'Error fetching latest data',
          );
        } else if (symbolsState is SymbolsFetchLoaded) {
          return SmallBottomNotification(
              title: 'Latest data fetched successfully');
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
