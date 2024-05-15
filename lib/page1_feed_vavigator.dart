import 'package:flutter/material.dart';
import 'package:app2/page1_feed.dart';
import 'package:app2/page1_detail.dart';

class FeedNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class FeedNavigator extends StatelessWidget {
  const FeedNavigator({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState>? navigatorKey;
  // final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex = 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[FeedNavigatorRoutes.detail]!(context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex = 500}) {
    return {
      FeedNavigatorRoutes.root: (context) => FeedPage(
            title: "feed abcd",
            onPush: (materialIndex) =>
                _push(context, materialIndex: materialIndex),
          ),
      FeedNavigatorRoutes.detail: (context) => NewPage(title: "nothing"),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: FeedNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
