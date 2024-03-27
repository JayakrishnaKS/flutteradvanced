import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/firebase_ex/email_password_auth/login_fire.dart';
import 'package:flutter_advanced/storages/firebase_ex/email_password_auth/register_fire.dart';

import 'fire_function.dart';

class sign_fire extends StatelessWidget {
  var email_cntrl = TextEditingController();
  var pass_cntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        titleTextStyle: TextStyle(fontSize: 20),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register Here!!!",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: email_cntrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: pass_cntrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Password"),
              ),
            ),
            ElevatedButton(onPressed: () {
              String email = email_cntrl.text.trim();
              String pass = pass_cntrl.text.trim();
              FireBaseHelper().registerUser(email: email, pwd: pass).then((
                  result) {
                if (result == null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register_fire()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Invalid entry"),
                    backgroundColor: Colors.redAccent,));
                }
              });
            }, child: Text("Register here"))
          ],
        ),
      ),
    );
  }
}
