import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/routes/index.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State createState() {
    return AppState();
  }
}

class AppState extends State<ChatApp> {
  AppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Routes.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'yaolx-chatGPT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          secondary: Colors.lime,
        ),
      ),
      onGenerateRoute: Routes.router.generator,
    );
    return app;
  }
}
