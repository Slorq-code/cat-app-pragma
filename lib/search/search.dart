import 'package:dio/dio.dart';
import 'search_response.dart';

const String _apiKey = '=bda53789-d59e-46cd-9bc4-2936630fde39';
const String _baseUrl = 'https://api.thecatapi.com/v1/breeds';

class BreedsService {
  final _dio = Dio();

  // BreedsService(String query);

  Future getBreedsByName(String name) async {
    
    final specific = name;
    try {
      final url = '$_baseUrl/search?q=$specific&x-api-key=$_apiKey';
      final resp = await _dio.get(url);

      final List<dynamic> breedsList = resp.data;
      print(breedsList);
      return breedsList.map((obj) => Breeds.fromJson(obj)).toList();
    } catch (e) {
      return [];
    }
  }
}


/*
class BreedsService with ChangeNotifier {
  List<Breeds> breed = [];
  BreedsService(String query);
  Future searchBreed(String query) async {
    final name = query;
    final url = "$_baseUrl/search?q=$name&x-api-key=$_apiKey";
    final response = await http.get(Uri.parse(url));
    final searchResponse = breedsFromJson(response.body);
    breed.addAll(searchResponse);
    print(searchResponse);
    return searchResponse;
  }
}
*/
