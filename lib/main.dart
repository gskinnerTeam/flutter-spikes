import 'package:flutter/material.dart';
import 'package:flutter_experiments/context_menu/context_menu_overlay.dart';
import 'package:provider/provider.dart';
import 'package:statsfl/statsfl.dart';

import 'app_model.dart';
import 'app_routing.dart';

// Some shared state for demo
AppModel _appModel = AppModel();

void main() {
  runApp(
    // Use StatsFl to show an FPS counter in top-left
    StatsFl(
      // Use Provider to pass the appModel down the tree
      child: ChangeNotifierProvider.value(
        value: _appModel,
        child: RootRestorationScope(
          restorationId: "MainRestorationScope",
          // Use the new Router API to enable deep-link and web-history
          child: MaterialApp.router(
            routerDelegate: AppRouterDelegate(_appModel),
            routeInformationParser: AppRouteParser(_appModel),
          ),
        ),
      ),
    ),
  );
}
