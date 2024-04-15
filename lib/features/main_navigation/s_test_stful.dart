import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clikcks = 0;

  void _increament() {
    setState(() {
      _clikcks++;
    });
  }

  @override
  void dispose() {
    print("$_clikcks");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$_clikcks",
            style: const TextStyle(fontSize: 50),
          ),
          TextButton(
            onPressed: _increament,
            child: const Text(
              "Click me to increment",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
