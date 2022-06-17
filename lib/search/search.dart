import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cat_aplication/search/search_response.dart';
import 'package:http/http.dart' as http;

/*
class SearchService with ChangeNotifier {
  List<Breeds> breed = [];

  SearchService() {
    getbreeds();
  }
 implementacion de busqueda
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
// ignore: constant_identifier_names
const _URL_CATS = "https://api.thecatapi.com/v1";
// ignore: constant_identifier_names
const _APIKEY = "bda53789-d59e-46cd-9bc4-2936630fde39";


Future<String> searchBreeds( String query ) async {

    final url = Uri.https( _URL_CATS, 'search?breed_names=', {
      'x-api-key': _APIKEY,
      'query': query
    });

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson( response.body );

    return searchResponse.name;
  }
/*
  void getSuggestionsByQuery( String searchTerm ) {

    breed.name = '';
    debouncer.onValue = ( value ) async {
      // print('Tenemos valor a buscar: $value');
      final results = await this.searchBreeds(value);
      this._suggestionStreamContoller.add( results );
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), ( _ ) { 
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration( milliseconds: 301)).then(( _ ) => timer.cancel());
  }


}

*/