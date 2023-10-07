import 'package:flutter/material.dart';
import 'package:se/Widgets/astronaut.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: astronaut(context)
        ),
      )),
    );
  }
}