import 'package:flutter_chatgpt/pages/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/utils/cahce.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCache.init();
  runApp(const ChatApp());
}
