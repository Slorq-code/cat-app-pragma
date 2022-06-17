import 'package:flutter/material.dart';

import 'package:cat_aplication/models/search_response.dart';

import 'package:http/http.dart' as http;

// esta es la logica para hacer el search 
/*
// ignore: constant_identifier_names
const _URL_CATS = "https://api.thecatapi.com/v1";
// ignore: constant_identifier_names
const _APIKEY = "bda53789-d59e-46cd-9bc4-2936630fde39";
// ignore: constant_identifier_names
final _BREEDS = query;

class SearchService with ChangeNotifier {
  List<Breeds> breed = [];

  SearchService() {
    getbreeds();
  }
// implementacion de busqueda
  getbreeds() async {
    final url ="$_URL_CATS/v1/images/x-api-key=$_APIKEY&search?breed_names=$_BREEDS";
    final resp = await http.get(Uri.parse(url));
    final catsResponse = breedFromJson(resp.body);
    breed.addAll(catsResponse);
    notifyListeners();
    return catsResponse;
  }
}

*/

class CatSearchDelegate extends SearchDelegate {


  @override
  String get searchFieldLabel => "  Search for a kitten <3";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = "", 
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }


  @override
  Widget buildResults(BuildContext context) {
    List<Breeds> breed;
    return const Text("build...");
   


  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      // ignore: avoid_unnecessary_containers
      return Container(
        child: const Center(
          child: Icon(Icons.pest_control_rodent_rounded,
              color: Colors.white54, size: 150),
        ),
      );
    }
    return Container();
  }
}
