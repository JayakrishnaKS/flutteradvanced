import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/shared_prefernce/login_and_registration/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: Register_Shared(),
    debugShowCheckedModeBanner: false,
  ));
}

class Register_Shared extends StatefulWidget {
  @override
  State<Register_Shared> createState() => _Register_SharedState();
}

class _Register_SharedState extends State<Register_Shared> {
  var formkey = GlobalKey<FormState>();
  var uname_controller = TextEditingController();
  var pass_controller = TextEditingController();
  var phone_controller = TextEditingController();
  late SharedPreferences preferences;

  ///late defines that this is used at anywhere and cant be null
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'username'),
                  validator: (username) {
                    if (username!.isEmpty || !username.contains('@')) {
                      return "Invalid Username";
                    } else {
                      return null;
                    }
                  },
                  controller: uname_controller,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'password'),
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return " Password must contain atleast 6 character";
                    } else {
                      return null;
                    }
                  },
                  controller: pass_controller,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'phonenumber'),
                  validator: (phonenumber) {
                    if (phonenumber!.isEmpty || phonenumber.length < 6) {
                      return 'phone number must atleast 6 ';
                    } else {
                      return null;
                    }
                  },
                  controller: phone_controller,
                ),
                ElevatedButton(
                    onPressed: () {
                      var valid = formkey.currentState!.validate();
                      if (valid == true) {
                        storeData();
                      }
                    },
                    child: Text("Register"))
              ],
            )),
      ),
    );
  }

  void storeData() async {
    String email = uname_controller.text.trim();
    String password = pass_controller.text.trim();
    //int phone_num=phone_controller.text as int;
    int phone_num = int.parse(phone_controller.text);
    preferences = await SharedPreferences.getInstance();
    preferences.setString('username', email);
    preferences.setString('pass', password);
    preferences.setInt('phone', phone_num);
    Navigator.push(context,
         MaterialPageRoute(builder: (context) => LoginShared()));
  }
}
