// To parse this JSON data, do
//
//     final cat = catFromJson(jsonString);

import 'dart:convert';

import 'package:cat_aplication/models/cats_models.dart';

class Breeds {
  Breeds({
    required this.name,
    required this.image,
  });
  String name;
  Images? image;
  factory Breeds.fromJson(Map<String, dynamic> json) => Breeds(
        name: json["name"],
        image: json["image"] == null ? null : Images.fromJson(json["image"]),
      );
}

class SearchResponse {
  SearchResponse({
    required this.name,
    required this.images,
    required page,
  });

  String name;
  Images? images;

  factory SearchResponse.fromJson(String str) =>
      SearchResponse.fromMap(json.decode(str));

  factory SearchResponse.fromMap(Map<String, dynamic> json) => SearchResponse(
        name: json["name"],
        images: json["image"] == null ? null : Images.fromJson(json["image"]),
        page: null,
      );

}
