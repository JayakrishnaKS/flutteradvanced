import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/firebase_ex/email_password_auth/fire_function.dart';
import 'package:flutter_advanced/storages/firebase_ex/email_password_auth/login_fire.dart';

class Home_Fire extends StatelessWidget {
  const Home_Fire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
      titleTextStyle: TextStyle(fontSize: 20),),
      body: Center(child: ElevatedButton(onPressed: (){
        FireBaseHelper().logout().then((value)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Register_fire())));
      }, child: Text("Signout")),),
    );
  }
}
