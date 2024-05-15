import 'package:flutter/material.dart';
import 'package:app2/page0_trends.dart';
import 'package:app2/page0_detail.dart';
import 'package:app2/tabItem.dart';

class TrendsNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TrendsNavigator extends StatelessWidget {
  const TrendsNavigator(
      {super.key, required this.navigatorKey, required this.tabItem});

  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex = 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TrendsNavigatorRoutes.detail]!(context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex = 500}) {
    return {
      TrendsNavigatorRoutes.root: (context) => TrendsPage(
            color: tabItem.color,
            title: tabItem.name,
            onPush: (materialIndex) =>
                _push(context, materialIndex: materialIndex),
          ),
      TrendsNavigatorRoutes.detail: (context) => ColorDetailPage(
            color: tabItem.color,
            title: tabItem.name,
            materialIndex: materialIndex,
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TrendsNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
