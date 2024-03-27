import 'package:flutter/material.dart';
import 'package:flutter_advanced/main.dart';
import 'package:flutter_advanced/storages/statemanagement/provider_ex/controller/counter_controller.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(create: (context)=>CounterProvider(),child: MyHomepage(),)
    );
  }
}
class  MyHomepage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider with consumer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("counter value",style: TextStyle(fontSize: 18),),
            Consumer<CounterProvider>(builder:( context,counterProvider,child){
              return Text(
                "${counterProvider.counter_value}",
                style: TextStyle(),
              );

            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){Provider.of<CounterProvider>(context,listen: false);}),
    );
  }
}
