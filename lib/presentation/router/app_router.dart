import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/home_page.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/login.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/register.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
          return MaterialPageRoute(builder: (_) => const MainPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return null;
    }
  }
}