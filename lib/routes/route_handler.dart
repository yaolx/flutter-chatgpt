import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aminate/pages/animate.dart';
import 'package:flutter_aminate/pages/image_hero.dart';

// 首页
var animateHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Animate();
});

var imageViewHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? id = params["id"]?.first;
  return ImageHero(id: id ?? '');
});
