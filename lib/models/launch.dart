// To parse this JSON data, do
//
//     final launch = launchFromMap(jsonString);

import 'dart:convert';

class Launch {
  Launch({
    required this.links,
    required this.details,
    required this.flightNumber,
    required this.name,
    required this.dateLocal,
    required this.id,
  });

  final Links links;
  final String? details;
  final int flightNumber;
  final String name;
  final DateTime dateLocal;
  final String id;

  Launch copyWith({
    Links? links,
    String? details,
    int? flightNumber,
    String? name,
    DateTime? dateLocal,
    String? id,
  }) =>
      Launch(
        links: links ?? this.links,
        details: details ?? this.details,
        flightNumber: flightNumber ?? this.flightNumber,
        name: name ?? this.name,
        dateLocal: dateLocal ?? this.dateLocal,
        id: id ?? this.id,
      );

  factory Launch.fromJson(String str) => Launch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Launch.fromMap(Map<String, dynamic> json) => Launch(
        links: Links.fromMap(json["links"]),
        details: json["details"],
        flightNumber: json["flight_number"],
        name: json["name"],
        dateLocal: DateTime.parse(json["date_local"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "links": links.toMap(),
        "details": details,
        "flight_number": flightNumber,
        "name": name,
        "date_local": dateLocal.toIso8601String(),
        "id": id,
      };
}

class Links {
  Links({required this.patch});

  final Patch patch;

  Links copyWith({Patch? patch}) => Links(patch: patch ?? this.patch);

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(patch: Patch.fromMap(json["patch"]));

  Map<String, dynamic> toMap() => {"patch": patch.toMap()};
}

class Patch {
  Patch({
    required this.small,
    required this.large,
  });

  final String ? small;
  final String ? large;

  Patch copyWith({
    String ? small,
    String ? large,
  }) =>
      Patch(
        small: small ?? this.small,
        large: large ?? this.large,
      );

  factory Patch.fromJson(String str) => Patch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Patch.fromMap(Map<String, dynamic> json) => Patch(
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toMap() => {
        "small": small,
        "large": large,
      };
}
