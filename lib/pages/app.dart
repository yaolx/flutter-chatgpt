import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../routes/index.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  AppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Routes.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Fluro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Routes.router.generator,
    );
    return app;
  }
}
