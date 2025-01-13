import 'dart:convert';

class Today {
  final DateTime? date;
  final Location? location;
  final Times? times;

  Today({
    this.date,
    this.location,
    this.times,
  });

  factory Today.fromRawJson(String str) => Today.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Today.fromJson(Map<String, dynamic> json) => Today(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        times: json["times"] == null ? null : Times.fromJson(json["times"]),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "location": location?.toJson(),
        "times": times?.toJson(),
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
        "admin1": admin1,
        "asciiname": asciiname,
        "geo": geo,
        "geonameid": geonameid,
      };
}

class Times {
  final DateTime? chatzotNight;
  final DateTime? alotHaShachar;
  final DateTime? misheyakir;
  final DateTime? misheyakirMachmir;
  final DateTime? dawn;
  final DateTime? sunrise;
  final DateTime? sofZmanShmaMga19Point8;
  final DateTime? sofZmanShmaMga16Point1;
  final DateTime? sofZmanShmaMga;
  final DateTime? sofZmanShma;
  final DateTime? sofZmanTfillaMga19Point8;
  final DateTime? sofZmanTfillaMga16Point1;
  final DateTime? sofZmanTfillaMga;
  final DateTime? sofZmanTfilla;
  final DateTime? chatzot;
  final DateTime? minchaGedola;
  final DateTime? minchaGedolaMga;
  final DateTime? minchaKetana;
  final DateTime? minchaKetanaMga;
  final DateTime? plagHaMincha;
  final DateTime? sunset;
  final DateTime? beinHaShmashos;
  final DateTime? dusk;
  final DateTime? tzeit7083Deg;
  final DateTime? tzeit85Deg;
  final DateTime? tzeit42Min;
  final DateTime? tzeit50Min;
  final DateTime? tzeit72Min;

  Times({
    this.chatzotNight,
    this.alotHaShachar,
    this.misheyakir,
    this.misheyakirMachmir,
    this.dawn,
    this.sunrise,
    this.sofZmanShmaMga19Point8,
    this.sofZmanShmaMga16Point1,
    this.sofZmanShmaMga,
    this.sofZmanShma,
    this.sofZmanTfillaMga19Point8,
    this.sofZmanTfillaMga16Point1,
    this.sofZmanTfillaMga,
    this.sofZmanTfilla,
    this.chatzot,
    this.minchaGedola,
    this.minchaGedolaMga,
    this.minchaKetana,
    this.minchaKetanaMga,
    this.plagHaMincha,
    this.sunset,
    this.beinHaShmashos,
    this.dusk,
    this.tzeit7083Deg,
    this.tzeit85Deg,
    this.tzeit42Min,
    this.tzeit50Min,
    this.tzeit72Min,
  });

  factory Times.fromRawJson(String str) => Times.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Times.fromJson(Map<String, dynamic> json) => Times(
        chatzotNight: json["chatzotNight"] == null
            ? null
            : DateTime.parse(json["chatzotNight"]),
        alotHaShachar: json["alotHaShachar"] == null
            ? null
            : DateTime.parse(json["alotHaShachar"]),
        misheyakir: json["misheyakir"] == null
            ? null
            : DateTime.parse(json["misheyakir"]),
        misheyakirMachmir: json["misheyakirMachmir"] == null
            ? null
            : DateTime.parse(json["misheyakirMachmir"]),
        dawn: json["dawn"] == null ? null : DateTime.parse(json["dawn"]),
        sunrise:
            json["sunrise"] == null ? null : DateTime.parse(json["sunrise"]),
        sofZmanShmaMga19Point8: json["sofZmanShmaMGA19Point8"] == null
            ? null
            : DateTime.parse(json["sofZmanShmaMGA19Point8"]),
        sofZmanShmaMga16Point1: json["sofZmanShmaMGA16Point1"] == null
            ? null
            : DateTime.parse(json["sofZmanShmaMGA16Point1"]),
        sofZmanShmaMga: json["sofZmanShmaMGA"] == null
            ? null
            : DateTime.parse(json["sofZmanShmaMGA"]),
        sofZmanShma: json["sofZmanShma"] == null
            ? null
            : DateTime.parse(json["sofZmanShma"]),
        sofZmanTfillaMga19Point8: json["sofZmanTfillaMGA19Point8"] == null
            ? null
            : DateTime.parse(json["sofZmanTfillaMGA19Point8"]),
        sofZmanTfillaMga16Point1: json["sofZmanTfillaMGA16Point1"] == null
            ? null
            : DateTime.parse(json["sofZmanTfillaMGA16Point1"]),
        sofZmanTfillaMga: json["sofZmanTfillaMGA"] == null
            ? null
            : DateTime.parse(json["sofZmanTfillaMGA"]),
        sofZmanTfilla: json["sofZmanTfilla"] == null
            ? null
            : DateTime.parse(json["sofZmanTfilla"]),
        chatzot:
            json["chatzot"] == null ? null : DateTime.parse(json["chatzot"]),
        minchaGedola: json["minchaGedola"] == null
            ? null
            : DateTime.parse(json["minchaGedola"]),
        minchaGedolaMga: json["minchaGedolaMGA"] == null
            ? null
            : DateTime.parse(json["minchaGedolaMGA"]),
        minchaKetana: json["minchaKetana"] == null
            ? null
            : DateTime.parse(json["minchaKetana"]),
        minchaKetanaMga: json["minchaKetanaMGA"] == null
            ? null
            : DateTime.parse(json["minchaKetanaMGA"]),
        plagHaMincha: json["plagHaMincha"] == null
            ? null
            : DateTime.parse(json["plagHaMincha"]),
        sunset: json["sunset"] == null ? null : DateTime.parse(json["sunset"]),
        beinHaShmashos: json["beinHaShmashos"] == null
            ? null
            : DateTime.parse(json["beinHaShmashos"]),
        dusk: json["dusk"] == null ? null : DateTime.parse(json["dusk"]),
        tzeit7083Deg: json["tzeit7083deg"] == null
            ? null
            : DateTime.parse(json["tzeit7083deg"]),
        tzeit85Deg: json["tzeit85deg"] == null
            ? null
            : DateTime.parse(json["tzeit85deg"]),
        tzeit42Min: json["tzeit42min"] == null
            ? null
            : DateTime.parse(json["tzeit42min"]),
        tzeit50Min: json["tzeit50min"] == null
            ? null
            : DateTime.parse(json["tzeit50min"]),
        tzeit72Min: json["tzeit72min"] == null
            ? null
            : DateTime.parse(json["tzeit72min"]),
      );

  Map<String, dynamic> toJson() => {
        "chatzotNight": {chatzotNight?.toIso8601String(), "Chatzot Night"},
        "alotHaShachar": {alotHaShachar?.toIso8601String(), "Alot Hashachar"},
        "misheyakir": {misheyakir?.toIso8601String(), "Misheyiakir"},
        "misheyakirMachmir": {
          misheyakirMachmir?.toIso8601String(),
          "Misheyakir Machmir"
        },
        "dawn": {dawn?.toIso8601String(), "Dawn"},
        "sunrise": {sunrise?.toIso8601String(), "Sunrise"},
        "sofZmanShmaMGA19Point8": {
          sofZmanShmaMga19Point8?.toIso8601String(),
          "Latest Shema MGA 19"
        },
        "sofZmanShmaMGA16Point1": {
          sofZmanShmaMga16Point1?.toIso8601String(),
          "Latest Shema MGA 16"
        },
        "sofZmanShmaMGA": {
          sofZmanShmaMga?.toIso8601String(),
          "Latest Shema MGA"
        },
        "sofZmanShma": {sofZmanShma?.toIso8601String(), "Latest Shema"},
        "sofZmanTfillaMGA19Point8": {
          sofZmanTfillaMga19Point8?.toIso8601String(),
          "Latest Tefila MGA 19"
        },
        "sofZmanTfillaMGA16Point1": {
          sofZmanTfillaMga16Point1?.toIso8601String(),
          "Latest Tefila MGA 16"
        },
        "sofZmanTfillaMGA": {
          sofZmanTfillaMga?.toIso8601String(),
          "Latest Tefila MGA"
        },
        "sofZmanTfilla": {sofZmanTfilla?.toIso8601String(), "Latest Tefila"},
        "chatzot": {chatzot?.toIso8601String(), "Chatzot"},
        "minchaGedola": {minchaGedola?.toIso8601String(), "Mincha Gdola"},
        "minchaGedolaMGA": {
          minchaGedolaMga?.toIso8601String(),
          "Mincha Gdola MGA"
        },
        "minchaKetana": {minchaKetana?.toIso8601String(), "Mincha Ktana"},
        "minchaKetanaMGA": {
          minchaKetanaMga?.toIso8601String(),
          "Mincha Ktana MGA"
        },
        "plagHaMincha": {plagHaMincha?.toIso8601String(), "Plag Mincha"},
        "sunset": {sunset?.toIso8601String(), "Sunset"},
        "beinHaShmashos": {
          beinHaShmashos?.toIso8601String(),
          "Bein Hashmashot"
        },
        "dusk": {dusk?.toIso8601String(), "Dusk"},
        "tzeit7083deg": {tzeit7083Deg?.toIso8601String(), "Stars 708"},
        "tzeit85deg": {tzeit85Deg?.toIso8601String(), "Stars 85"},
        "tzeit42min": {tzeit42Min?.toIso8601String(), "Stars 42"},
        "tzeit50min": {tzeit50Min?.toIso8601String(), "Stars 50"},
        "tzeit72min": {tzeit72Min?.toIso8601String(), "Stars 72"},
      };
}
