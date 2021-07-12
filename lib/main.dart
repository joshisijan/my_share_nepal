import 'package:flutter/material.dart';
import 'package:my_share_nepal/app.dart';
import 'package:my_share_nepal/cubit/fetch_symbols_cubit.dart';
import 'package:my_share_nepal/cubit/portfolio_cubit.dart';
import 'package:my_share_nepal/cubit/portfolio_multi_symbols_cubit.dart';
import 'package:my_share_nepal/cubit/symbols_cubit.dart';
import 'package:my_share_nepal/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(AppBase());
}

class AppBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => PortfolioCubit(),
        ),
        BlocProvider(
          create: (context) => PortfolioMultiSymbolsCubit(),
        ),
        BlocProvider(
          create: (context) => SymbolsCubit(),
        ),
        BlocProvider(
          create: (context) => FetchSymbolsCubit(),
        ),
      ],
      child: AppBaseInternal(),
    );
  }
}

class AppBaseInternal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: App(),
        );
      },
    );
  }
}
