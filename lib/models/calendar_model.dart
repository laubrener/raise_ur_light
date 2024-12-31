import 'dart:convert';

class Result {
  final String? title;
  final DateTime? date;
  final String? version;
  final Location? location;
  final Range? range;
  final List<Item>? items;

  Result({
    this.title,
    this.date,
    this.version,
    this.location,
    this.range,
    this.items,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        version: json["version"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        range: json["range"] == null ? null : Range.fromJson(json["range"]),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "date": date?.toIso8601String(),
        "version": version,
        "location": location?.toJson(),
        "range": range?.toJson(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  final String? title;
  final dynamic date;
  final String? hdate;
  final String? category;
  final String? subcat;
  final String? hebrew;
  final String? link;
  final String? memo;
  final String? titleOrig;
  final Leyning? leyning;

  Item({
    this.title,
    this.date,
    this.hdate,
    this.category,
    this.subcat,
    this.hebrew,
    this.link,
    this.memo,
    this.titleOrig,
    this.leyning,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["title"],
        date: json["date"],
        hdate: json["hdate"],
        category: json["category"],
        subcat: json["subcat"],
        hebrew: json["hebrew"],
        link: json["link"],
        memo: json["memo"],
        titleOrig: json["title_orig"],
        leyning:
            json["leyning"] == null ? null : Leyning.fromJson(json["leyning"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "date": date,
        "hdate": hdate,
        "category": category,
        "subcat": subcat,
        "hebrew": hebrew,
        "link": link,
        "memo": memo,
        "title_orig": titleOrig,
        "leyning": leyning?.toJson(),
      };
}

class Leyning {
  final String? the1;
  final String? the2;
  final String? the3;
  final String? the4;
  final String? torah;
  final String? the5;
  final String? the6;
  final String? the7;
  final String? haftarah;
  final String? maftir;
  final Triennial? triennial;

  Leyning({
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.torah,
    this.the5,
    this.the6,
    this.the7,
    this.haftarah,
    this.maftir,
    this.triennial,
  });

  factory Leyning.fromRawJson(String str) => Leyning.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Leyning.fromJson(Map<String, dynamic> json) => Leyning(
        the1: json["1"],
        the2: json["2"],
        the3: json["3"],
        the4: json["4"],
        torah: json["torah"],
        the5: json["5"],
        the6: json["6"],
        the7: json["7"],
        haftarah: json["haftarah"],
        maftir: json["maftir"],
        triennial: json["triennial"] == null
            ? null
            : Triennial.fromJson(json["triennial"]),
      );

  Map<String, dynamic> toJson() => {
        "1": the1,
        "2": the2,
        "3": the3,
        "4": the4,
        "torah": torah,
        "5": the5,
        "6": the6,
        "7": the7,
        "haftarah": haftarah,
        "maftir": maftir,
        "triennial": triennial?.toJson(),
      };
}

class Triennial {
  final String? the1;
  final String? the2;
  final String? the3;
  final String? the4;
  final String? the5;
  final String? the6;
  final String? the7;
  final String? maftir;

  Triennial({
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.the5,
    this.the6,
    this.the7,
    this.maftir,
  });

  factory Triennial.fromRawJson(String str) =>
      Triennial.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Triennial.fromJson(Map<String, dynamic> json) => Triennial(
        the1: json["1"],
        the2: json["2"],
        the3: json["3"],
        the4: json["4"],
        the5: json["5"],
        the6: json["6"],
        the7: json["7"],
        maftir: json["maftir"],
      );

  Map<String, dynamic> toJson() => {
        "1": the1,
        "2": the2,
        "3": the3,
        "4": the4,
        "5": the5,
        "6": the6,
        "7": the7,
        "maftir": maftir,
      };
}

class Location {
  final String? title;
  final String? city;
  final String? tzid;
  final double? latitude;
  final double? longitude;
  final String? cc;
  final String? country;
  final int? elevation;
  final String? admin1;
  final String? asciiname;
  final String? geo;
  final int? geonameid;

  Location({
    this.title,
    this.city,
    this.tzid,
    this.latitude,
    this.longitude,
    this.cc,
    this.country,
    this.elevation,
    this.admin1,
    this.asciiname,
    this.geo,
    this.geonameid,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        title: json["title"],
        city: json["city"],
        tzid: json["tzid"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        cc: json["cc"],
        country: json["country"],
        elevation: json["elevation"],
        admin1: json["admin1"],
        asciiname: json["asciiname"],
        geo: json["geo"],
        geonameid: json["geonameid"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "city": city,
        "tzid": tzid,
        "latitude": latitude,
        "longitude": longitude,
        "cc": cc,
        "country": country,
        "elevation": elevation,
        "admin1": admin1,
        "asciiname": asciiname,
        "geo": geo,
        "geonameid": geonameid,
      };
}

class Range {
  final DateTime? start;
  final DateTime? end;

  Range({
    this.start,
    this.end,
  });

  factory Range.fromRawJson(String str) => Range.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Range.fromJson(Map<String, dynamic> json) => Range(
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "start":
            "${start!.year.toString().padLeft(4, '0')}-${start!.month.toString().padLeft(2, '0')}-${start!.day.toString().padLeft(2, '0')}",
        "end":
            "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
      };
}
