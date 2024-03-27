import 'package:flutter/material.dart';
import 'package:flutter_advanced/animation/animation%20in%20navigation/second_page_animation.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(
      MaterialApp(home: Main_Animation(), debugShowCheckedModeBanner: false,));
}

class Main_Animation extends StatefulWidget {
  const Main_Animation({super.key});

  @override
  State<Main_Animation> createState() => _Main_AnimationState();
}

class _Main_AnimationState extends State<Main_Animation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryanimation) {
                    return Scond_Page_Animation();
                  },
                  transitionsBuilder: (context, animation, animation2, child) {
                    return FadeTransition(opacity: animation, child: child,);
                  },
                  transitionDuration: Duration(milliseconds: 1000)));
            }, child: Text("Fade Animation")), SizedBox(height: 15,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Scond_Page_Animation();
                },
                transitionsBuilder: (context, animation, secondaryAnimation,
                    child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: const Offset(0.0, 0.0),
                    ).animate(animation),


                    child: child,
                  );
                },
              ));
            }, child: Text("Slide Animation")), SizedBox(height: 15,),
            ElevatedButton(onPressed: () {Navigator.push(context,  PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Scond_Page_Animation();
                },
                transitionsBuilder: (context, animation, secondaryAnimation,
                    child) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },transitionDuration: Duration(milliseconds: 600)

            ));

            }, child: Text("Scale Animation")),SizedBox(height: 15,), ElevatedButton(onPressed: () {
              Navigator.push(context, PageTransition(
                duration: Duration(seconds: 1),
                  child: Scond_Page_Animation(),
                  type: PageTransitionType.topToBottomPop,
              
                 ));
            }, child:Text("USing packages"))
          ],
        ),
      ),
    );
  }
}
