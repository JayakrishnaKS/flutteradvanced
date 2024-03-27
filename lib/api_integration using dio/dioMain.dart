
import 'package:flutter/material.dart';
import 'package:flutter_advanced/api_integration%20using%20dio/view/datahome.dart';
import 'package:get/get.dart';
void main(){
  runApp(Diomain());
}
class Diomain extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: DataHomeDio(),
    );
  }
}
