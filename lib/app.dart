import 'package:flutter/material.dart';
import 'package:my_share_nepal/screen/search_page.dart';
import 'package:my_share_nepal/tab/home_tab.dart';
import 'package:my_share_nepal/tab/portfolio_tab.dart';
import 'package:my_share_nepal/tab/search_tab.dart';
import 'package:my_share_nepal/tab/setting_tab.dart';
import 'package:my_share_nepal/tab/tools_tab.dart';
import 'package:my_share_nepal/widget/bottom_fetching_indicator.dart';

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
  void initState() {
    super.initState();
    // context
    //     .read<FetchSymbolsCubit>()
    //     .autoFetchSymbols(); // auto fetch latest data every 2 minutes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _bottomNavigationBarIndex == 2
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchPage(
                    searchIndex: 1, //redirects with add button in tile
                  ),
                );
              },
            )
          : null,
      body: Stack(
        children: [
          PageView(
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomFetchingIndicator(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _bottomNavigationBarIndex,
        onTap: (index) {
          _appBasePageController.jumpToPage(index);
        },
        selectedFontSize: 12.0,
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
