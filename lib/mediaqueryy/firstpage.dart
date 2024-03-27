import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: mainPageMedia(),debugShowCheckedModeBanner: false,));
}

class mainPageMedia extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    bool isLargeScreen = width > 600;
    return Scaffold(
      body: isLargeScreen == true ? BigScreen() : MobileScreen(),
    );
  }
}

class BigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Big Screen"), backgroundColor: Colors.blue,),
      body: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ),
              Expanded(child: ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    color: Colors.pink.shade50,
                    child: Text("Video $index"),
                  ),
                );
              }))
            ],
          ),
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Padding(padding:EdgeInsets.all(12.0),
            child: Card(
              color: Colors.orange,
              child: Text("video $index"),
            ),);
          }))
        ],
      ),
    );
  }
}

class MobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Screen"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              height: 300,
              decoration: BoxDecoration(color: Colors.greenAccent),
            ),
          ),
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                color: Colors.pink.shade50,
                child: Text("Video $index"),
              ),
            );
          }))
        ],
      ),
    );
  }
}
