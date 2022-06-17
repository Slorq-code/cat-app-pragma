// To parse this JSON data, do
//
//     final cat = catFromJson(jsonString);

import 'dart:convert';

List<Breeds> breedFromJson(String str) => List<Breeds>.from(json.decode(str).map((x) => Breeds.fromJson(x)));

String breedToJson(List<Breeds> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image == null ? null : image?.toJson(),
    };
}

class Images {
    Images({
        required this.id,
        required this.width,
        required this.height,
        required this.url, Images? image,
    });

    String? id;
    int? width;
    int? height;
    String? url;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"] == null ? null : json["id"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "url": url == null ? null : url,
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

