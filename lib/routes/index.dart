import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handler.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String home1 = "/home1";
  static String demoFunc = "/demo/func";
  static String deepLink = "/message";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: homeHandler);
    router.define(home, handler: homeHandler);
    router.define(home1,
        handler: demoRouteHandler, transitionType: TransitionType.inFromRight);
    router.define(demoFunc, handler: demoRouteHandler);
    router.define(deepLink, handler: deepLinkHandler);
  }
}
