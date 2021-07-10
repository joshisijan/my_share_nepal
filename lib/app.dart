import 'package:flutter/material.dart';
import 'package:my_share_nepal/cubit/portfolio_cubit.dart';
import 'package:my_share_nepal/cubit/symbols_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/tab/home_tab.dart';
import 'package:my_share_nepal/tab/portfolio_tab.dart';
import 'package:my_share_nepal/tab/search_tab.dart';
import 'package:my_share_nepal/tab/setting_tab.dart';
import 'package:my_share_nepal/tab/tools_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final PageController _appBasePageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int _bottomNavigationBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _bottomNavigationBarIndex == 2
          ? MaterialButton(
              child: Icon(
                Icons.add,
                color: Theme.of(context).primaryColorDark,
              ),
              color: Theme.of(context).primaryColorLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              ),
              onPressed: () async {
                context.read<PortfolioCubit>().insertSymbol(PortfolioModel(
                      symbolId: 3,
                      purchaseDate: DateTime.now(),
                      quantity: 10,
                      purchasePrice: 200.2,
                    ));
              },
            )
          : null,
      body: PageView(
        controller: _appBasePageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (pageIndex) {
          if (pageIndex != _bottomNavigationBarIndex) {
            setState(() {
              _bottomNavigationBarIndex = pageIndex;
            });
          }
        },
        children: [
          HomeTab(),
          SearchTab(),
          PortfolioTab(),
          ToolsTab(),
          SettingTab()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _bottomNavigationBarIndex,
        onTap: (index) {
          _appBasePageController.jumpToPage(index);
        },
        selectedFontSize: 12.0,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor:
            Theme.of(context).colorScheme.onPrimary.withAlpha(100),
        selectedItemColor:
            Theme.of(context).colorScheme.onPrimary.withAlpha(200),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            activeIcon: Icon(Icons.work),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handyman_outlined),
            activeIcon: Icon(Icons.handyman),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
