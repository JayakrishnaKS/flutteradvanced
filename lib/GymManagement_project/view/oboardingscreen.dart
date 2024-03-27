import 'package:flutter/material.dart';
import 'package:flutter_advanced/GymManagement_project/view/Login.dart';
import 'package:introduction_screen/introduction_screen.dart';
void main(){runApp(MaterialApp(home: onboarding_screeens(),debugShowCheckedModeBanner: false,));}
class onboarding_screeens extends StatefulWidget {
  const onboarding_screeens({super.key});

  @override
  State<onboarding_screeens> createState() => _onboarding_screeensState();
}

class _onboarding_screeensState extends State<onboarding_screeens> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(globalBackgroundColor: Color(0xFF473F97),
      pages: [
        PageViewModel(
            title: "Welcome",
            image: Image.asset("assets/images/gym2.jpg"),
            body:
                "If You are Looking to manage the gym \n click next to proceed"),
        PageViewModel(
            title: "Gym for a better Physique",
            image: Image.asset("assets/images/gym3.jpg"),body: "This is a Fitness app")
      ],onDone: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>loginPage()));
        
    },done: Text("Done",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
      back: TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Previous")),
      next: Icon(Icons.arrow_forward_outlined),
    );
  }
}
