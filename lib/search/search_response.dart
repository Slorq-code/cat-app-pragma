
import 'dart:convert';

List<Breed> breedFromJson(String str) => List<Breed>.from(json.decode(str).map((x) => Breed.fromJson(x)));

String breedToJson(List<Breed> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Breed {
    Breed({
        required this.name,
        required this.image,
    });

    String name;
    Images? image;


    factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        name: json["name"],
        image: json["image"] == null ? null : Images.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        // ignore: prefer_null_aware_operators
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

