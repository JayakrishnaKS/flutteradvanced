import 'package:flutter/material.dart';
import 'package:flutter_advanced/GymManagement_project/view/bottom_nav.dart';
import 'package:flutter_advanced/GymManagement_project/view/home.dart';
import 'package:flutter_advanced/GymManagement_project/view/signup.dart';

import '../../storages/shared_prefernce/login_and_registration/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';



class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            ClipPath(
              clipper: ArcClipper(),
              child: Container(
                height: 210,
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
                          "Gym System",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white70),
                        ),
                      ],
                    )),
              ),
            ),

            // SizedBox(
            //   height: 20,#d6e5ea
            // ),
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor:Color(0xFF473F97),
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
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
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),

                    // borderSide: BorderSide(color: Colors.black87)
                  ),
                ),
              ),
            ),
            // ListTile(
            //     trailing: TextButton(
            //       onPressed: () {},
            //       child: Text("Forget password?",
            //           style: TextStyle(color: Colors.black)),
            //     )),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  MusicApp ()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF568896),
                  ),
                ),
                child: Text("Login",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => signupPage()));
              },
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(text: "Dont have an account?  "),
                        TextSpan(
                            text: "signup",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:  Color(0xFF568896)))
                      ])),
            )
          ]),
        ),
      ),
    );
  }
}
//
// void main() {
//   runApp(MaterialApp(
//     home: login_stateful(),
//     debugShowCheckedModeBanner: false,
//   ));
// }
//
// class login_stateful extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return login_statefulstate();
//   }
// }
//
// class login_statefulstate extends State<login_stateful> {
//   final formkey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login page"),
//       ),
//       body: Padding(
//         padding:
//             const EdgeInsets.only(left: 28.0, right: 28.0, top: 20, bottom: 20),
//         child: Form(
//           key: formkey,
//           child: Column(
//             children: [
//               Image(
//                 image: AssetImage("assets/images/gym.jpg"),
//                 height: 200,
//                 width: 200,
//               ),
//               TextFormField(
//                 validator: (Username) {
//                   if (Username!.isEmpty || !Username.contains('@')) {
//                     return 'username is invalid!';
//                   } else {
//                     return null;
//                   }
//                 },
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30)),
//                     hintText: "username"),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               TextFormField(
//                 validator: (password) {
//                   if (password!.isEmpty || password!.length < 6) {
//                     return 'Password is invalid';
//                   } else {
//                     return null;
//                   }
//                 },
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30)),
//                     hintText: "password"),
//               ),
//               MaterialButton(
//                   color: Colors.white10,
//                   shape: StadiumBorder(),
//                   minWidth: 170,
//                   height: 50,
//                   child: Text(
//                     "Login",
//                     style: TextStyle(color: Colors.redAccent),
//                   ),
//                   onPressed: () {
//                     final valid = formkey.currentState?.validate();
//                     if (valid == true) {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => MusicApp()));
//                     }
//                   }),
//               TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => signup_stateful()));
//                   },
//                   child: Text("don't have an account? SIGNUP here"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
