import 'package:flutter/material.dart';
import 'package:testapp/presentation/pages/register_page.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.register: (_) => const RegisterPage(),
  };
}
