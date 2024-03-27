import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  String name;
  String phone;
 Screen2({super.key, required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Text("Welcome $name and contact no is $phone",style: TextStyle(fontSize: 20),)


      ),
    );
  }
}
