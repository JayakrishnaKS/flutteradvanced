import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/firebase_ex/email_password_auth/home_fire.dart';
import 'package:flutter_advanced/storages/firebase_ex/email_password_auth/register_fire.dart';

import 'fire_function.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyByLvDpI8_baGbs-X7HyllnxTuGHNJrmto",
          appId: "1:769755012205:android:0313220c61fa799ce73364",
          messagingSenderId: "",
          projectId: "sept2projectnew",
          storageBucket: "sept2projectnew.appspot.com")
  );
  runApp(MaterialApp(
    home: Register_fire(),
    debugShowCheckedModeBanner: false,
  ));
}

class Register_fire extends StatelessWidget {
  var email_cntrl = TextEditingController();
  var pass_cntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        titleTextStyle: TextStyle(fontSize: 20),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login Here!!!",
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
            ElevatedButton(
                onPressed: () {String email = email_cntrl.text.trim();
                String pass = pass_cntrl.text.trim();

                FireBaseHelper()
                    .loginUser(email: email, pwd: pass)
                    .then((result) {
                  if (result == null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home_Fire()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.blue, content: Text(result)));
                  }
                });

                },
                child: Text("Login")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => sign_fire()));
                },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
