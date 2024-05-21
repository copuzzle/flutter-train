import 'package:flutter/material.dart';
import 'package:app2/service/project/index_page.dart';
import 'package:app2/service/project/detail.dart';

class ProjectNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class ProjectNavigator extends StatelessWidget {
  const ProjectNavigator({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState>? navigatorKey;

  void _push(BuildContext context, {int materialIndex = 500}) {
    var routeBuilders = _routeBuilders(context,
        materialIndex: materialIndex, title: "dynamic project name");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[ProjectNavigatorRoutes.detail]!(context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex = 500, String title = ""}) {
    return {
      ProjectNavigatorRoutes.root: (context) => ProjectPage(
            title: "Projects",
            onPush: (materialIndex) =>
                _push(context, materialIndex: materialIndex),
          ),
      ProjectNavigatorRoutes.detail: (context) => ProjectDetailPage(
            title: title,
            materialIndex: materialIndex,
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: ProjectNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
