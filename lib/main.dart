import 'package:flutter/material.dart';
import 'package:to_do_app/features/home/presentation/manger/task_provider.dart';
import 'package:to_do_app/features/splash/presentation/view/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
