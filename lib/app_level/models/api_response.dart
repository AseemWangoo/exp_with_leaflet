// ignore_for_file: prefer_single_quotes

import 'dart:convert' show json;

List<MapResponse> mapResponseFromJson(String str) => List<MapResponse>.from(
    json.decode(str).map((x) => MapResponse.fromJson(x)));

String mapResponseToJson(List<MapResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MapResponse {
  String type;
  Properties properties;
  Geometry geometry;
  String id;

  MapResponse({
    this.type,
    this.properties,
    this.geometry,
    this.id,
  });

  factory MapResponse.fromJson(Map<String, dynamic> json) => MapResponse(
        type: json["type"],
        properties: Properties.fromJson(json["properties"]),
        geometry: Geometry.fromJson(json["geometry"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "properties": properties.toJson(),
        "geometry": geometry.toJson(),
        "id": id,
      };
}

class Geometry {
  List<List<List<double>>> coordinates;
  String type;

  Geometry({
    this.coordinates,
    this.type,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates: List<List<List<double>>>.from(json["coordinates"].map(
            (x) => List<List<double>>.from(
                x.map((x) => List<double>.from(x.map((x) => x.toDouble())))))),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) =>
            List<dynamic>.from(
                x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
        "type": type,
      };
}

class Properties {
  String name;
  String frenchName;
  String slug;
  String description;
  String frenchDescription;
  String color;

  Properties({
    this.name,
    this.frenchName,
    this.slug,
    this.description,
    this.frenchDescription,
    this.color,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        name: json["Name"],
        frenchName: json["FrenchName"],
        slug: json["Slug"],
        description: json["description"],
        frenchDescription: json["FrenchDescription"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "FrenchName": frenchName,
        "Slug": slug,
        "description": description,
        "FrenchDescription": frenchDescription,
        "color": color,
      };
}
