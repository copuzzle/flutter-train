import 'package:flutter/material.dart';
import 'package:app2/app_tab.dart';
import 'package:app2/app_bottom_navigator.dart';
import 'package:app2/service/project/index_navigator.dart';
import 'package:app2/service/task/index_navigator.dart';
import 'package:app2/service/notice/index.dart';

class LimeApp extends StatelessWidget {
  const LimeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter  ONE',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainPage(title: 'Flutter ONES'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentTab = TabItem.red;
  final _navigatorKeys = {
    TabItem.red: GlobalKey<NavigatorState>(),
    TabItem.green: GlobalKey<NavigatorState>(),
    TabItem.blue: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) => (didPop) async {
        //app platform back button related, may should need to be debug
        if (didPop) {
          return false;
        }
        final bool isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.red) {
            // select 'main' tab
            _selectTab(TabItem.red);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          Offstage(
            offstage: _currentTab != TabItem.red,
            child: ProjectNavigator(
              navigatorKey: _navigatorKeys[TabItem.red],
            ),
          ),
          Offstage(
              offstage: _currentTab != TabItem.green,
              child: FilterNavigator(
                navigatorKey: _navigatorKeys[TabItem.green],
              )),
          Offstage(
            offstage: _currentTab != TabItem.blue,
            child: IndexPage("mememe"),
          ),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }
}
