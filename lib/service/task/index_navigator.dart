import 'package:flutter/material.dart';
import 'package:app2/service/task/page1_feed.dart';
import 'package:app2/service/task/detail.dart';

class FeilterNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class FilterNavigator extends StatelessWidget {
  const FilterNavigator({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState>? navigatorKey;
  // final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex = 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[FeilterNavigatorRoutes.detail]!(context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex = 500}) {
    return {
      FeilterNavigatorRoutes.root: (context) => FilterPage(
            title: "feed abcd",
            onPush: (materialIndex) =>
                _push(context, materialIndex: materialIndex),
          ),
      FeilterNavigatorRoutes.detail: (context) => DetailPage(title: "nothing"),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: FeilterNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
