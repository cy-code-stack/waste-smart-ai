import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePage();
}

class _MainHomePage extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Ongoing UI Components',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 100, 100, 100),
          ),
        ),
      ),
    );
  }
}
