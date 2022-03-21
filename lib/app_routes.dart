enum AppRoutes {
  chatScreen,
  loginScreen,
}

extension AppRoutesExtension on AppRoutes {
  String get name {
    switch (this) {
      case AppRoutes.chatScreen:
        return '/chat_screen';
      case AppRoutes.loginScreen:
        return 'login_screen';
    }
  }
}
