import 'package:flutter/material.dart';
import 'package:outnet/screens/login_screen.dart';

import 'app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.loginScreen.name,
      navigatorKey: _navigatorKey,
      routes: {
        AppRoutes.loginScreen.name: (context) => LoginScreen(),
        AppRoutes.chatScreen.name: (context) => LoginScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
