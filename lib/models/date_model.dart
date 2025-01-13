import 'dart:convert';

class HebrewDate {
  final int? gYear;
  final int? gMonth;
  final int? gDay;
  final bool? afterSunset;
  final int? hebYear;
  final String? hebMonth;
  final int? hebDay;
  final String? hebrew;
  final HeDateParts? heDateParts;
  final List<String>? events;

  HebrewDate({
    this.gYear,
    this.gMonth,
    this.gDay,
    this.afterSunset,
    this.hebYear,
    this.hebMonth,
    this.hebDay,
    this.hebrew,
    this.heDateParts,
    this.events,
  });

  factory HebrewDate.fromRawJson(String str) =>
      HebrewDate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  String dateString() {
    return "${hebMonth ?? "Tishrei"} ${hebDay ?? 1}, ${hebYear ?? 5785}";
  }

  factory HebrewDate.fromJson(Map<String, dynamic> json) => HebrewDate(
        gYear: json["gy"],
        gMonth: json["gm"],
        gDay: json["gd"],
        afterSunset: json["afterSunset"],
        hebYear: json["hy"],
        hebMonth: json["hm"],
        hebDay: json["hd"],
        hebrew: json["hebrew"],
        heDateParts: json["heDateParts"] == null
            ? null
            : HeDateParts.fromJson(json["heDateParts"]),
        events: json["events"] == null
            ? []
            : List<String>.from(json["events"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "gy": gYear,
        "gm": gMonth,
        "gd": gDay,
        "afterSunset": afterSunset,
        "hy": hebYear,
        "hm": hebMonth,
        "hd": hebDay,
        "hebrew": hebrew,
        "heDateParts": heDateParts?.toJson(),
        "events":
            events == null ? [] : List<dynamic>.from(events!.map((x) => x)),
      };
}

class HeDateParts {
  final String? y;
  final String? m;
  final String? d;

  HeDateParts({
    this.y,
    this.m,
    this.d,
  });

  factory HeDateParts.fromRawJson(String str) =>
      HeDateParts.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HeDateParts.fromJson(Map<String, dynamic> json) => HeDateParts(
        y: json["y"],
        m: json["m"],
        d: json["d"],
      );

  Map<String, dynamic> toJson() => {
        "y": y,
        "m": m,
        "d": d,
      };
}
