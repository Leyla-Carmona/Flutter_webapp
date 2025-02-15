import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[_details(context), _details(context)]),
    );
  }

  Widget _details(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 125,
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                height: 125,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black12,
                ),
              ),
              SizedBox(width: 26),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'title',
                    style: TextStyle(fontSize: 20, fontFamily: 'arial'),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'description',
                    style: TextStyle(fontSize: 20, fontFamily: 'arial'),
                  ),
                  Container(height: 10, width: 80, color: Colors.purple),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
