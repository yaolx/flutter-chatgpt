import 'package:flutter_chatgpt/pages/message/index.dart';
import 'package:flutter_chatgpt/pages/login.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/pages/poetry/index.dart';
import 'package:flutter_chatgpt/pages/poetry/webview.dart';

// 首页
var chatHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ChatPage();
});

// 登录页
var loginRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Login();
});

// 古诗页
var poetryRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Poetry();
});

// 古诗页webview
var poetryWebviewRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const PoetryWebview();
});
