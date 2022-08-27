// To parse this JSON data, do
//
//     final Alert = AlertFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Alert alertFromJson(String str) => Alert.fromJson(json.decode(str));

String alertToJson(Alert data) => json.encode(data.toJson());

class Alert {
  Alert({
    required this.count,
    required this.overflow,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final bool overflow;
  final dynamic next;
  final dynamic previous;
  final List<Result> results;

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
        count: json["count"],
        overflow: json["overflow"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "overflow": overflow,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.relevance,
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.labels,
    required this.rank,
    required this.localRank,
    required this.aviationRank,
    required this.phqAttendance,
    required this.entities,
    required this.duration,
    required this.start,
    required this.end,
    required this.updated,
    required this.firstSeen,
    required this.timezone,
    required this.location,
    required this.geo,
    required this.impactPatterns,
    required this.scope,
    required this.country,
    required this.placeHierarchies,
    required this.state,
    required this.brandSafe,
    required this.private,
  });

  final int relevance;
  final String id;
  final String title;
  final String description;
  final String category;
  final List<String> labels;
  final int rank;
  final dynamic localRank;
  final dynamic aviationRank;
  final dynamic phqAttendance;
  final List<dynamic> entities;
  final int duration;
  final DateTime start;
  final DateTime end;
  final DateTime updated;
  final DateTime firstSeen;
  final String timezone;
  final List<double> location;
  final Geo geo;
  final List<ImpactPattern> impactPatterns;
  final String scope;
  final String country;
  final List<List<String>> placeHierarchies;
  final String state;
  final bool brandSafe;
  final bool private;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        relevance: json["relevance"],
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        labels: List<String>.from(json["labels"].map((x) => x)),
        rank: json["rank"],
        localRank: json["local_rank"],
        aviationRank: json["aviation_rank"],
        phqAttendance: json["phq_attendance"],
        entities: List<dynamic>.from(json["entities"].map((x) => x)),
        duration: json["duration"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        updated: DateTime.parse(json["updated"]),
        firstSeen: DateTime.parse(json["first_seen"]),
        timezone: json["timezone"],
        location: List<double>.from(json["location"].map((x) => x.toDouble())),
        geo: Geo.fromJson(json["geo"]),
        impactPatterns: List<ImpactPattern>.from(
            json["impact_patterns"].map((x) => ImpactPattern.fromJson(x))),
        scope: json["scope"],
        country: json["country"],
        placeHierarchies: List<List<String>>.from(json["place_hierarchies"]
            .map((x) => List<String>.from(x.map((x) => x)))),
        state: json["state"],
        brandSafe: json["brand_safe"],
        private: json["private"],
      );

  Map<String, dynamic> toJson() => {
        "relevance": relevance,
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "labels": List<dynamic>.from(labels.map((x) => x)),
        "rank": rank,
        "local_rank": localRank,
        "aviation_rank": aviationRank,
        "phq_attendance": phqAttendance,
        "entities": List<dynamic>.from(entities.map((x) => x)),
        "duration": duration,
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
        "updated": updated.toIso8601String(),
        "first_seen": firstSeen.toIso8601String(),
        "timezone": timezone,
        "location": List<dynamic>.from(location.map((x) => x)),
        "geo": geo.toJson(),
        "impact_patterns":
            List<dynamic>.from(impactPatterns.map((x) => x.toJson())),
        "scope": scope,
        "country": country,
        "place_hierarchies": List<dynamic>.from(
            placeHierarchies.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "state": state,
        "brand_safe": brandSafe,
        "private": private,
      };
}

class Geo {
  Geo({
    required this.geometry,
  });

  final Geometry geometry;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        geometry: Geometry.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "geometry": geometry.toJson(),
      };
}

class Geometry {
  Geometry({
    required this.coordinates,
    required this.type,
  });

  final List<double> coordinates;
  final String type;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
      };
}

class ImpactPattern {
  ImpactPattern({
    required this.vertical,
    required this.impactType,
    required this.impacts,
  });

  final String vertical;
  final String impactType;
  final List<Impact> impacts;

  factory ImpactPattern.fromJson(Map<String, dynamic> json) => ImpactPattern(
        vertical: json["vertical"],
        impactType: json["impact_type"],
        impacts:
            List<Impact>.from(json["impacts"].map((x) => Impact.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "vertical": vertical,
        "impact_type": impactType,
        "impacts": List<dynamic>.from(impacts.map((x) => x.toJson())),
      };
}

class Impact {
  Impact({
    required this.dateLocal,
    required this.value,
    required this.position,
  });

  final DateTime dateLocal;
  final int value;
  final String position;

  factory Impact.fromJson(Map<String, dynamic> json) => Impact(
        dateLocal: DateTime.parse(json["date_local"]),
        value: json["value"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "date_local":
            "${dateLocal.year.toString().padLeft(4, '0')}-${dateLocal.month.toString().padLeft(2, '0')}-${dateLocal.day.toString().padLeft(2, '0')}",
        "value": value,
        "position": position,
      };
}
