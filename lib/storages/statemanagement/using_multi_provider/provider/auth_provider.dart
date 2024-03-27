import 'package:flutter/material.dart';

class Auth_Provider extends ChangeNotifier{
  bool loggedIn=false;
  bool get login=>loggedIn;
  void logedin(){
    loggedIn=true;
    notifyListeners();
  }void logedOut(){
    loggedIn=false;
    notifyListeners();
  }
}