import 'package:flutter_chatgpt/pages/message/index.dart';
import 'package:flutter_chatgpt/pages/login.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

// 首页
var chatHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return ChatPage();
});

// 登录页
var loginRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Login();
});
