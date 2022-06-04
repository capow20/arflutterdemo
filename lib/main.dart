import 'package:arway_flutter_demo_app/home_view.dart';
import 'package:arway_flutter_demo_app/unity_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': ((context) => const HomeView()),
        '/unity': ((context) => const UnityView())
      },
    );
  }
}
