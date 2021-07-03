import 'package:flutter/material.dart';
import 'package:my_share_nepal/widget/home_tab.dart';
import 'package:my_share_nepal/widget/portfolio_tab.dart';
import 'package:my_share_nepal/widget/search_tab.dart';
import 'package:my_share_nepal/widget/setting_tab.dart';
import 'package:my_share_nepal/widget/tools_tab.dart';

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
      appBar: AppBar(),
      body: PageView(
        controller: _appBasePageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (pageIndex) {
          setState(() {
            _bottomNavigationBarIndex = pageIndex;
          });
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.portable_wifi_off_outlined),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.toggle_on_sharp),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
