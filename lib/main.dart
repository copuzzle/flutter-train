import 'package:app2/keepAliveWrapper.dart';
import 'package:app2/page0_trends.dart';
import 'package:app2/page1_feed.dart';
import 'package:app2/page2_community.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LimeApp());
}

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
  PageController? _pageController;

  /// 0: trends
  /// 1: feed
  /// 2: community
  int _pageIdx = 0;
  List<Widget> _pages = [];
  List<BottomNavigationBarItem> _navs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: navigationTapped, currentIndex: _pageIdx, items: _navs));
  }

  void onPageChanged(int page) {
    setState(() {
      _pageIdx = page;
    });
  }

  void navigationTapped(int page) {
    _pageController?.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();
    _pages
      ..add(KeepAliveWrapper(
        keepAlive: true,
        child: Container(
          color: Colors.red,
          child: TrendsPage("Trends"),
        ),
      ))
      ..add(Container(
        color: Colors.blue,
        child: FeedPage("feed"),
      ))
      ..add(Container(
        color: Colors.grey,
        child: CommunityPage("社区"),
      ));
    _pageController = PageController();

    _navs = [
      BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: "trends",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.location_on),
        label: "feed",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people),
        label: "社区",
      ),
    ];
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
}
