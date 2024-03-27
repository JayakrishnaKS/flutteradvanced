import 'package:flutter/material.dart';

class products extends StatefulWidget {
  const products({super.key});

  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFF473F97),
          title: Text("Product offered",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GridView.builder(itemCount: 8,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio: 2,mainAxisSpacing: 4,crossAxisSpacing: 2),
              itemBuilder: (context,index){return Container(decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/protein.jpg",))
              ),

              );}),
        ));
  }
}
