import 'package:flutter/material.dart';

class count_provider extends  ChangeNotifier{
  int counter=0;
  int get count=>counter;
  void increment(){
    counter++;
    notifyListeners();
  }
}