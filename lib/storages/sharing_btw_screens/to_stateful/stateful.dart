import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  String name;
  String phone;

  Screen1({super.key, required this.name, required this.phone});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: Text(
          "Welcome ${widget.name},${widget.phone}",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
