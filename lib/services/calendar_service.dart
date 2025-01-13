import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:raise_ur_light/models/calendar_model.dart';
import 'package:raise_ur_light/models/date_model.dart';
import 'package:raise_ur_light/models/today_model.dart';

class CalendarService {
  final String now = DateTime.now().toString().split(' ')[0];

  Future<Result> getWeeklyItems() async {
    Uri url = Uri.parse(
        'https://www.hebcal.com/shabbat?cfg=json&geonameid=3435910&M=on&a=on');

    Response resp = await http
        .get(url, headers: {'Content-Type': 'application/json;charset=UTF-8'});

    Result result = Result.fromRawJson(utf8.decode(resp.bodyBytes));

    // List<Item> itemsList = result.items ?? [];

    return result;
  }

  Future<HebrewDate> getDate() async {
    Uri url = Uri.parse(
        'https://www.hebcal.com/converter?cfg=json&date=$now&g2h=1&strict=1');

    Response resp = await http
        .get(url, headers: {'Content-Type': 'application/json;charset=UTF-8'});

    HebrewDate result = HebrewDate.fromRawJson(utf8.decode(resp.bodyBytes));

    return result;
  }

  Future<Today> getTodayTimes() async {
    Uri url = Uri.parse(
        'https://www.hebcal.com/zmanim?cfg=json&geonameid=3435910&date=$now');

    Response resp = await http
        .get(url, headers: {'Content-Type': 'application/json;charset=UTF-8'});

    Today result = Today.fromRawJson(utf8.decode(resp.bodyBytes));

    return result;
  }

  Future<Result> getAnualItems() async {
    Uri url = Uri.parse(
        'https://www.hebcal.com/hebcal?v=1&cfg=json&maj=on&min=on&mod=on&nx=on&year=now&month=x&ss=on&mf=on&c=on&geo=geoname&geonameid=3435910&M=on&s=on');

    Response resp = await http
        .get(url, headers: {'Content-Type': 'application/json;charset=UTF-8'});

    Result result = Result.fromRawJson(utf8.decode(resp.bodyBytes));

    return result;
  }
}
