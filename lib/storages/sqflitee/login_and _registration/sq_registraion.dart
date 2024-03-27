import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/sqflitee/login_and%20_registration/sq_login.dart';
import 'package:flutter_advanced/storages/sqflitee/login_and%20_registration/sqflite_functions.dart';

class Sq_Register extends StatelessWidget {
  var name_cntrl = TextEditingController();
  var pass_cntrl = TextEditingController();
  var email_cntrl = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void registerUser(String name, String email, String password) async {
      var id = await SQL_Functions.addUser(name, email, password);
      print(id);
      if (id != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Sq_Login()));
      }
    }
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 28.0,right: 28,top: 28),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Name"),
                ),
              ), Padding(
                padding: const EdgeInsets.only(left: 28.0,right: 28,top: 28),
                child: TextFormField(validator: (email) {
                  if (email!.isEmpty || !email.contains('@')) {
                    return "invalid username or the field is empty";
                  } else {
                    return null;
                  }
                },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "email"),
                ),
              ), TextFormField(validator: (pass) {
                if (pass!.isEmpty || pass.length < 6) {
                  return "password length should  contain atleast 6 character";
                } else {
                  return null;
                }
              },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Password"),
              ),
              ElevatedButton(onPressed: () async {
                var valid = formkey.currentState!.validate();
                if (valid == true) {
                  var users = await SQL_Functions.checkUser_already_registered(
                      email_cntrl.text);
                  if (users.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Users already registered"),
                      backgroundColor: Colors.redAccent,));
                  }else{
                  registerUser(
                    name_cntrl.text, email_cntrl.text, pass_cntrl.text,);}
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Ivalid fields please verify"),
                    backgroundColor: Colors.redAccent,));
                }
              }, child: Text("Register"))
            ],
          ),
        ),
      ),
    );
  }


}
