import 'package:flutter/material.dart';
import 'package:flutter_advanced/storages/statemanagement/provider_ex/theme_provider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child:MyApp1()),);
}
class MyApp1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(theme: Provider.of<ThemeProvider>(context).isDarkTheme?ThemeData.dark():ThemeData.light(),
      home:  App_Theme_changer(),
      debugShowCheckedModeBanner: false,
    );
  }

}

class App_Theme_changer extends StatelessWidget {
  const App_Theme_changer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).switchTheme();
            },
            child: Text("Switch theme")),
      ),
    );
  }
}
