import 'package:flutter/material.dart';
import 'package:flutter_advanced/GymManagement_project/view/Login.dart';

import '../../storages/shared_prefernce/login_and_registration/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';



class signupPage extends StatelessWidget {
  signupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ClipPath(
                clipper: ArcClipper(),
                child: Container(
                  height: 220,
                  color: Color(0xFF473F97),
                  child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 27),
                          Text(
                            "",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Signup",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white70),
                          ),
                        ],
                      )),
                ),
              ),
              Text(
                "Create Account",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF473F97),
                    hintText: "Username",
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                      // borderSide: BorderSide(color: Colors.black87)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF473F97),
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                      // borderSide: BorderSide(color: Colors.black87)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF473F97),
                    hintText: "Password",
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,

                      // borderSide: BorderSide(color: Colors.black87)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF473F97),
                    hintText: "Confirm Password",
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,

                      // borderSide: BorderSide(color: Colors.black87)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => loginPage()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF473F97),
                    ),
                  ),
                  child: Text("Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}