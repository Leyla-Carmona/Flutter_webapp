import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webapp/Pages/details.dart';
import 'package:webapp/providers/providers.dart';

class Homeapp extends StatelessWidget {
  const Homeapp({super.key});

  @override
  Widget build(BuildContext context) {
    final api = Provider.of<Apiprovider>(context, listen: false);
    api.fetchList();

    return Scaffold(
      body: Consumer<Apiprovider>(
        builder: (context, provider, child) {
          if (api.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (api.amiibos.isEmpty) {
            return const Center(child: Text('Data is empty'));
          } else {
            return ListView.builder(
              itemCount: api.amiibos.length,
              itemBuilder: (context, index) {
                return _card(context, api.amiibos[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget _card(BuildContext context, dynamic amiibo) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details(amiibo: amiibo)),
        );
      },
      child: Padding(
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(amiibo.img, fit: BoxFit.contain),
                  ),
                ),
                SizedBox(width: 26),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      amiibo.type,
                      style: TextStyle(fontSize: 20, fontFamily: 'arial'),
                    ),
                    SizedBox(height: 12),
                    Text(amiibo.name, style: TextStyle(fontFamily: 'arial')),
                    Container(
                      height: 10,
                      width: 220,
                      color: const Color.fromARGB(79, 78, 68, 0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
