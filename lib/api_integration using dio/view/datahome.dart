import 'package:flutter/material.dart';
import 'package:flutter_advanced/api_integration%20using%20dio/controller/datacontroller.dart';
import 'package:flutter_advanced/api_integration%20using%20dio/utilis/colors.dart';
import 'package:flutter_advanced/api_integration%20using%20dio/utilis/const_snackbar.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main(){
  runApp(MaterialApp(home: DataHomeDio(),));
}
class DataHomeDio extends StatelessWidget {
  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Data dio"), backgroundColor: MyColors.prColor,),
      backgroundColor: MyColors.bgColor,
      floatingActionButton: Obx(() =>
      controller.isNetConnected.value
          ? _buildFAB()
          : Container()),
      body: Obx(() =>
          SizedBox(height: double.infinity,
            width: double.infinity,
            child: controller.isNetConnected.value ? (controller.isLoading.value
                ? CircularProgressIndicator()
                : getData()) : noInternet( context),)),
    );
  }

  RefreshIndicator getData() {
    return RefreshIndicator(onRefresh: () {
      return controller.fetchData();
    },
      child: ScrollablePositionedList.builder(
          itemScrollController: controller.scrollController,
          itemCount: controller.datas.length,
          itemBuilder:(context,index){return InkWell(
            child: Card(child: ListTile(
              leading: CircleAvatar(
                child: Text(controller.datas[index].id.toString()),
                backgroundColor: MyColors.scColor,
              ),title: Text("${controller.datas[index].title}"),
              subtitle: Text("${controller.datas[index].body}"),
            ),),
          );}),);
  }


  FloatingActionButton _buildFAB() {
    return FloatingActionButton(onPressed: () {
      controller.isListDown.value ? controller.scrollToUp() : controller
          .scrollToDown();},
    backgroundColor: MyColors.prColor,
      child: FaIcon(controller.isListDown.value?FontAwesomeIcons.arrowUp19:FontAwesomeIcons.arrowDown19),);
  }

 Center noInternet(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Text("No Internet"),
        MaterialButton(onPressed: ()async{if(await InternetConnectionChecker().hasConnection){
          controller.fetchData();}
          else{
          showCustomSnackBar(context);
        }
   },child: Text("Try again"),)
      ],),
    );
 }



}