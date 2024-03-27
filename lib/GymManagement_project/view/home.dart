import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: home_page(),
  ));
}

class home_page extends StatefulWidget {
  @override
  State<home_page> createState() => _homepageState();
}

class _homepageState extends State<home_page> {
  var adding = [
    Text(


      
      "Trainers\n\n No:3",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
    ),
    Text("Gym Member\n\n No:6",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)),
   Text("Equipments\n\nNo:21",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)) ,
    Text("Product\n\nNo:8",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white))

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF473F97),
        title: Text(
          "Home page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

      ),
      body: Center(
        child: GridView.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2,mainAxisSpacing: 8),
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  child: Center(child: adding[index]),
                  color:  Color(0xFF473F97)
                ),
              );
            }),
      ),
  drawer: Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: Color(0xFF473F97) ),
            // otherAccountsPictures: [
            //   CircleAvatar(backgroundImage: ,)
            // ],
            currentAccountPicture: CircleAvatar(

            ),
            accountName: Text(""),
            accountEmail: Text("")),
        ListTile(
          leading:  Icon(Icons.settings,color: Colors.white,),
          title: Text("Settings",style: TextStyle(color: Colors.white)),

        ),
        ListTile(
          leading:  Icon(Icons.logout,color: Colors.white,),
          title: Text("Logout",style: TextStyle(color: Colors.white),),

        )],
    ),
  ),  );
  }
}
