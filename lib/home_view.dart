import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("HomeView"),
      ),
      body: Center(
        child: Container(
          height: 75,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.red),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/unity');
            },
            child: const Text("Open Unity Scene",
                style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
