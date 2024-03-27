import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Heromain(),debugShowCheckedModeBanner: false,));
}
class Heromain extends StatelessWidget {
  const Heromain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero main page"),
      elevation: 5,
      backgroundColor: Colors.red,),
     body: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroDetails()));

    },child: Hero(
       tag: 'imageHero',
      child: Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(50),color: Colors.greenAccent
        , ),
         child: Icon(Icons.tour,color: Colors.white,size: 50,),
       ),
    ),
    ),
    );
  }
}

class HeroDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Hero Details page"),
        elevation: 5,
        backgroundColor: Colors.red,),
      body: Center(child:  GestureDetector(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Heromain()));

    },child: Hero(
    tag: 'imageHero',
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),color: Colors.red
    , ),
    child: Icon(Icons.playlist_add_circle_rounded,color: Colors.white,size: 50,),
    ),
    ),

      )),
    );
  }

}
