import 'package:flutter/material.dart';
import 'package:togo/presentation/disquette/widgets/disquette_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DisquetteAppBar(title: "Home"),
      body: Center(
        child: Text("This is my app"),
      ),
    );
  }
}