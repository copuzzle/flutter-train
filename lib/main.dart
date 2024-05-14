import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: [
            Container(color: Colors.red),
            Container(color: Colors.blue),
            Container(color: Colors.grey)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: navigationTapped,
            currentIndex: _page,
            items: [
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
                label: "community",
              ),
            ]));
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    _pageController?.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }
}
