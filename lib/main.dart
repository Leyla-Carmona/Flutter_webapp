import 'package:flutter/material.dart';
import 'package:webapp/Pages/home.dart';

void main() => runApp(const MyApp()); //pernmite dar el inicio de la app

class MyApp extends StatelessWidget {
  //Mi primer widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app',
      home: Recipes(),
    ); //App llama a Recipes
  }
}

class Recipes extends StatelessWidget {
  //StatelessWidget: Su estado no va a cambiar
  const Recipes({super.key});

  @override //Constructor
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Recipe Book', style: TextStyle(color: Colors.white)),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            tabs: [Tab(icon: Icon(Icons.home), text: 'Home')],
          ),
        ),
        body: TabBarView(children: [Home()]),
      ),
    );
  }
}
