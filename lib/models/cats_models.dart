
import 'dart:convert';

List<Cat> catFromJson(String str) =>
    List<Cat>.from(json.decode(str).map((x) => Cat.fromJson(x)));

String catToJson(List<Cat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cat {
  Cat({
    required this.weight,
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.description,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.image,
  });

  Weight weight;
  String id;
  String name;
  String temperament;
  String origin;
  String countryCodes;
  String description;
  int childFriendly;
  int dogFriendly;
  int energyLevel;
  int grooming;
  int healthIssues;
  int intelligence;
  Images? image;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        weight: Weight.fromJson(json["weight"]),
        id: json["id"],
        name: json["name"],
        temperament: json["temperament"],
        origin: json["origin"],
        countryCodes: json["country_codes"],
        description: json["description"],
        childFriendly: json["child_friendly"],
        dogFriendly: json["dog_friendly"],
        energyLevel: json["energy_level"],
        grooming: json["grooming"],
        healthIssues: json["health_issues"],
        intelligence: json["intelligence"],
        image: json["image"] == null ? null : Images.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "weight": weight.toJson(),
        "id": id,
        "name": name,
        "temperament": temperament,
        "origin": origin,
        "country_codes": countryCodes,
        "description": description,
        "child_friendly": childFriendly,
        "dog_friendly": dogFriendly,
        "energy_level": energyLevel,
        "grooming": grooming,
        "health_issues": healthIssues,
        "intelligence": intelligence,
        // ignore: prefer_null_aware_operators
        "image": image == null ? null : image?.toJson(),
      };
}

class Images {
  Images({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    Images? image,
  });

  String? id;
  int? width;
  int? height;
  String? url;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
      };
}

class Weight {
  Weight({
    required this.imperial,
    required this.metric,
  });

  String imperial;
  String metric;

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        imperial: json["imperial"],
        metric: json["metric"],
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
      };
}
