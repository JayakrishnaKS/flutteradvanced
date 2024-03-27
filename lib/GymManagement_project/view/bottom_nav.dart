import 'package:flutter/material.dart';
import 'package:flutter_advanced/GymManagement_project/view/memberlist.dart';

import '../Trainers.dart';
import '../products.dart';
import 'equipmentadd/screenequipments.dart';
import 'home.dart';



void main(){
  runApp(MaterialApp(
    home: MusicApp(),
    debugShowCheckedModeBanner: false,
  ));
}
class MusicApp extends StatefulWidget {
  const MusicApp({super.key});

  @override
  State<MusicApp> createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  int index = 0;
  var screen =[home_page(),Trainers(),memberlist(),screen1(),products()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Colors.blueAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons .home,color: Colors.black),label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons .person,color: Colors.black),label: "Trainers"),
          BottomNavigationBarItem(icon: Icon(Icons.people,color: Colors.black,),label: "Members"),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center,color: Colors.black,),label: "Equipments"),
          BottomNavigationBarItem(icon: Icon(Icons .shopping_cart,color: Colors.black),label: "Product"),

        ],
        onTap: (tapindex) {
          setState(() {
            index = tapindex;
          });
        },
        currentIndex:index ,
        selectedItemColor: Colors.blue,
      ),
      body: screen[index],
    );
  }
}