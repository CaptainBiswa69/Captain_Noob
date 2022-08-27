// To parse this JSON data, do
//
//     final locationId = locationIdFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LocationId locationIdFromJson(String str) =>
    LocationId.fromJson(json.decode(str));

String locationIdToJson(LocationId data) => json.encode(data.toJson());

class LocationId {
  LocationId({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final dynamic next;
  final dynamic previous;
  final List<Result> results;

  factory LocationId.fromJson(Map<String, dynamic> json) => LocationId(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.type,
    required this.name,
    required this.county,
    required this.region,
    required this.country,
    required this.countryAlpha2,
    required this.countryAlpha3,
    required this.location,
  });

  final String id;
  final String type;
  final String name;
  final dynamic county;
  final String region;
  final String country;
  final String countryAlpha2;
  final String countryAlpha3;
  final List<double> location;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        county: json["county"],
        region: json["region"] ?? "",
        country: json["country"],
        countryAlpha2: json["country_alpha2"],
        countryAlpha3: json["country_alpha3"],
        location: List<double>.from(json["location"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "county": county,
        "region": region,
        "country": country,
        "country_alpha2": countryAlpha2,
        "country_alpha3": countryAlpha3,
        "location": List<dynamic>.from(location.map((x) => x)),
      };
}
