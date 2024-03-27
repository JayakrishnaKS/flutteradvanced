import 'package:flutter/material.dart';
import 'package:flutter_advanced/getexx/controller.dart';
import 'package:flutter_advanced/storages/statemanagement/provider_ex/controller/counter_controller.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(GetMaterialApp(home: Get_Main(),debugShowCheckedModeBanner: false,));
}
class Get_Main extends StatelessWidget {
  const Get_Main({super.key});

  @override
  Widget build(BuildContext context) {
    final CountController controller = Get.put(CountController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Example"),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text("Count=${controller.count}")),
            ElevatedButton(onPressed: ()=>controller.increment(), child: Text("Increment")),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: ()=>controller.decrement(), child: Text("Decrement"))
          ],
        ),
      ),
    );
  }
}
