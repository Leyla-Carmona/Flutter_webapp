import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webapp/models/amiibo.dart';
import 'package:http/http.dart' as http;

class Apiprovider extends ChangeNotifier {
  bool loading = false;
  List<Amiibo> amiibos = [];

  Future<void> fetchList() async {
    loading = true;
    notifyListeners();

    final url = Uri.parse('https://www.amiiboapi.com/api/amiibo/?name=zelda');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        amiibos = List<Amiibo>.from(
          data['amiibo'].map((amiibo) => Amiibo.fromJson(amiibo)),
        );
      } else {
        print('Error with the data ${response.statusCode}');
        amiibos = [];
      }
    } catch (e) {
      print('Error in request');
      amiibos = [];
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
