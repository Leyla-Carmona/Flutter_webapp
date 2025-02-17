import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webapp/Pages/home.dart';
import 'package:webapp/providers/providers.dart';

void main() => runApp(const MyApp()); //pernmite dar el inicio de la app

class MyApp extends StatelessWidget {
  //Mi primer widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Apiprovider())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nintendo Amiibo App',
        home: Start(),
      ), //App llama a Recipes
    );
  }
}

class Start extends StatelessWidget {
  //StatelessWidget: Su estado no va a cambiar
  const Start({super.key});

  @override //Constructor
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(79, 78, 68, 0),
          title: Text(
            'Api Nintendo Amiibos',
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            tabs: [Tab(icon: Icon(Icons.home), text: 'Home')],
          ),
        ),
        body: TabBarView(children: [Homeapp()]),
      ),
    );
  }
}
