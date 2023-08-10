import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aminate/routes/index.dart';
import 'package:flutter_aminate/reducer/page.dart';
import 'package:provider/provider.dart';

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
      title: '切屏动画',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          secondary: Colors.lime,
        ),
      ),
      onGenerateRoute: Routes.router.generator,
    );
    return ChangeNotifierProvider(
      create: (context) => PageReducer(),
      child: app,
    );
  }
}
