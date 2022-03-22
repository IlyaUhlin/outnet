import 'package:flutter/material.dart';
import 'package:outnet/screens/chat_screen.dart';
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
        AppRoutes.loginScreen.name: (context) => const LoginScreen(),
        AppRoutes.chatScreen.name: (context) => const ChatScreen(),
      },
    );
  }
}
