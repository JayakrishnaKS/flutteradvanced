import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/GymManagement_project/view/Login.dart';
import 'package:lottie/lottie.dart';


void main() {
  runApp(MaterialApp(
    home: splashPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class splashPage extends StatefulWidget {
  const splashPage({super.key});

  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => loginPage()));
    });
    //  Timer(Duration, (seconds:5)() { })
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   Color(0xFF568896), //Color(0xFF473F97),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset(
            "assets/animations/Animation - 1698747719171.json",
            height: 300,
            width: 300,
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            "Gym App",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "Get Fit With Us",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white70),
          )
        ]),
      ),
    );
  }
}