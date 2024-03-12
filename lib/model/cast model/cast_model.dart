import 'dart:convert';

List<CastModel> castModelFromJson(String str) =>
    List<CastModel>.from(json.decode(str).map((x) => CastModel.fromJson(x)));

String castModelToJson(List<CastModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CastModel {
  Person? person;
  Character? character;
  bool? self;
  bool? voice;

  CastModel({
    required this.person,
    required this.character,
    required this.self,
    required this.voice,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        person: json["person"] == null ? null : Person.fromJson(json["person"]),
        character: json["character"] == null
            ? null
            : Character.fromJson(json["character"]),
        self: json["self"],
        voice: json["voice"],
      );

  Map<String, dynamic> toJson() => {
        "person": person?.toJson(),
        "character": character?.toJson(),
        "self": self,
        "voice": voice,
      };
}

class Character {
  int? id;
  String? url;
  String? name;
  Links? links;

  Character({
    required this.id,
    required this.url,
    required this.name,
    required this.links,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "_links": links?.toJson(),
      };
}

class Image {
  String? medium;
  String? original;

  Image({
    required this.medium,
    required this.original,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}

class Links {
  Self? self;

  Links({
    required this.self,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? null : Self.fromJson(json["self"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
      };
}

class Self {
  String? href;

  Self({
    required this.href,
  });

  factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Person {
  int? id;
  String? url;
  String? name;
  Country? country;
  String? gender;
  Image? image;
  int? updated;
  Links? links;

  Person({
    required this.id,
    required this.url,
    required this.name,
    required this.country,
    required this.gender,
    required this.image,
    required this.updated,
    required this.links,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        country: json["country"] == null
            ? null
            : Country.fromJson(json["country"]),
        gender: json["gender"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        updated: json["updated"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "country": country?.toJson(),
        "gender": gender,
        "image": image?.toJson(),
        "updated": updated,
        "_links": links?.toJson(),
      };
}

class Country {
  String? name;
  String? code;
  String? timezone;

  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "timezone": timezone,
      };
}
