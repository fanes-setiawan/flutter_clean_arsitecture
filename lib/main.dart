import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/config/routes/app_pages.dart';
import 'package:testapp/config/routes/app_routes.dart';
import 'package:testapp/presentation/blocs/register_bloc/register_bloc.dart';
import 'config/injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => di.sl<RegisterBloc>(),
        child: MaterialApp(
          initialRoute: AppRoutes.register,
          routes: AppPages.routes,
        ),
      ),
    );
  }
}
