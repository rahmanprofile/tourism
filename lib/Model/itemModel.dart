
import 'dart:convert';

List<List<ItemModel>> itemModelFromJson(String str) => List<List<ItemModel>>.from(json.decode(str).map((x) => List<ItemModel>.from(x.map((x) => ItemModel.fromJson(x)))));

String itemModelToJson(List<List<ItemModel>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class ItemModel {
    ItemModel({
        required this.name,
        required this.location,
        required this.price,
        required this.image,
        required this.facilities,
        required this.description,
        required this.score,
    });

    String name;
    String location;
    String price;
    String image;
    List<Facility> facilities;
    String description;
    String score;

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        name: json["name"],
        location: json["location"],
        price: json["price"],
        image: json["image"],
        facilities: List<Facility>.from(json["facilities"].map((x) => Facility.fromJson(x))),
        description: json["description"],
        score: json["score"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "location": location,
        "price": price,
        "image": image,
        "facilities": List<dynamic>.from(facilities.map((x) => x.toJson())),
        "description": description,
        "score": score,
    };
}

class Facility {
    Facility({
        required this.name,
        required this.icon,
    });

    String name;
    String icon;

    factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        name: json["name"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
    };
}
