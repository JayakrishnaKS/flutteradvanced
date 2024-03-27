import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: DataSelection(),debugShowCheckedModeBanner: false,));
}
class DataSelection extends StatefulWidget {
  const DataSelection({super.key});

  @override
  State<DataSelection> createState() => _DataSelectionState();
}

class _DataSelectionState extends State<DataSelection> {
DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          controller: TextEditingController(text: "${selectedDate.toLocal()}".split(" ")[0]),
          onTap:()=>selectDate(context),
          readOnly:true,
          decoration:InputDecoration(labelText:"Select Date",suffixIcon:Icon(Icons.calendar_month))
        ),
      ),
    );
  }

Future<void>selectDate(BuildContext context)async{
  final DateTime? pickedDate=await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2030));
  if(pickedDate!=null &&pickedDate!=selectedDate){
    setState((){selectedDate=pickedDate;

    });

  }}
}