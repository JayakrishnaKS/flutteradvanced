import 'package:flutter/material.dart';

class Scond_Page_Animation extends StatelessWidget {
  const Scond_Page_Animation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child:Text("Go back to Main page")),
      ),
    );
  }
}
