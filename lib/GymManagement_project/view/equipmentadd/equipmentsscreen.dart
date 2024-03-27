
import '../mkinput.dart';
import 'package:flutter/material.dart';
import 'package:raised_buttons/raised_buttons.dart';
void main(){
  runApp(MaterialApp(home: AddEquipments(),debugShowCheckedModeBanner: false,));
}


class AddEquipments extends StatefulWidget {
  @override
  _AddEquipmentsState createState() => _AddEquipmentsState();
}

class _AddEquipmentsState extends State<AddEquipments> {
  

  final TextEditingController eqnameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController servtermController = TextEditingController();
  final TextEditingController servdateController = TextEditingController()
    ..text = 'Please select a Service / Bought Date.';
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar:AppBar(title: Text("Equipments"),leading: Icon(Icons.arrow_back),),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Palette.secondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Enter Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MakeInput(
                        label: 'Equipment Name',
                        obscureText: false,
                        controllerID: eqnameController,
                      ),
                      MakeInput(
                        label: 'Category',
                        obscureText: false,
                        controllerID: categoryController,
                      ),
                      MakeInput(
                        label: 'Service Terms',
                        obscureText: false,
                        controllerID: servtermController,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Next Service Date / Bought Date',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextField(
                            controller: servdateController,
                            enabled: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0.0,
                                horizontal: 10.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          MaterialButton(
                            child: Text('Pick a Date'),
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2100),
                              ).then((_dateTime) {
                                setState(() {

                                });
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Palette.secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    Text(
                      'Confirm Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

          ],
        ),
      ),
    );
  }
}

class Palette {
  static Color primaryColor=Color(0xFFF1F9FD);
  static Color secondaryColor=Color(0xFF473F97);
}