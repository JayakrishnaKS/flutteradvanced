import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_advanced/my%20work/loginn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepagee extends StatefulWidget {
  const homepagee({super.key});

  @override
  State<homepagee> createState() => _homepageeState();
}

class _homepageeState extends State<homepagee> {
  late SharedPreferences preferences;
  var username;
  @override
  void initState() {
  fetchdata();
    super.initState();
  } void fetchdata() async{
    preferences=await SharedPreferences.getInstance();
    setState(() {
      username= preferences.getString("uname");
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
      title: Text("Welcome $username"),
    ),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            preferences.setBool("usercheck",true);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>loginnnn()));
          }, child: Text("Logout")),
        ],
      )),
    );
  }


}
