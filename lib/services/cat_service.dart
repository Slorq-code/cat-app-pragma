import 'package:flutter/material.dart';
import 'package:cat_aplication/models/cats_models.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const _URL_CATS = "https://api.thecatapi.com/v1";
// ignore: constant_identifier_names
const _APIKEY = "bda53789-d59e-46cd-9bc4-2936630fde39";
// ignore: constant_identifier_names

class CatsService with ChangeNotifier {
 
 
  List<Cat> cats = [];
  CatsService() {
    getCats();
  }

  getCats() async {
    // ignore: prefer_const_declarations
    final url = "$_URL_CATS/breeds?x-api-key=$_APIKEY";
    final resp = await http.get(Uri.parse(url));
    final catsResponse = catFromJson(resp.body);
    cats.addAll(catsResponse);
    notifyListeners();
    return catsResponse;
  }
}
