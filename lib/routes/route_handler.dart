import '../pages/message.dart';
import '../pages/home.dart';
import '../pages/home1.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

// 首页
var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? title = params['title']?.first;
  print(title);
  return MyHomePage(
    title: title ?? 'home',
  );
});

var demoRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? title = params["title"]?.first;
  print(title);
  return MyHomePage1(
    title: title ?? 'home1',
  );
});

var deepLinkHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  Color color = const Color(0xFFFFFFFF);
  return Message(message: "DEEEEEP LINK!!!", color: color);
});
