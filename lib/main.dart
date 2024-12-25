import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/service_provider.dart';
import 'routes/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ServiceProvider(),
      child: MaterialApp.router(
        title: 'KaamSaaz',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: AppRoutes.router, // Integrate GoRouter
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
