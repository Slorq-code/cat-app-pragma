import 'package:flutter/material.dart';

import 'dart:async';
import 'package:cat_aplication/search/search_response.dart';
import 'debouncer.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class BreedsService with ChangeNotifier {
  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  final String _apiKey = 'bda53789-d59e-46cd-9bc4-2936630fde39';
  final String _baseUrl = 'https://api.thecatapi.com/v1/images';

  List<Breed> breed = [];

  final StreamController<List<Breed>> _suggestionStreamContoller =
      StreamController.broadcast();
  Stream<List<Breed>> get suggestionStream => _suggestionStreamContoller.stream;

  BreedsService(String query);

  Future<List<Breed>> searchBreed(String query) async {
    final url = Uri.https(_baseUrl, '/search?breed_names=',
        {'x-api-key': _apiKey, 'query': query});

    final response = await http.get(url);
    final searchResponse = breedFromJson(response.body);
    breed.addAll(searchResponse);
    return searchResponse;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      // ignore: avoid_print
      print('Tenemos valor a buscar: $value');
      final results = await searchBreed(value);
      _suggestionStreamContoller.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }
}
