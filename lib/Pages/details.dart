import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final dynamic amiibo;

  const Details({super.key, required this.amiibo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(amiibo.title),
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              amiibo.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.network(amiibo.img),
            const SizedBox(height: 10),
            Text("Tipo: ${amiibo.type}", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
