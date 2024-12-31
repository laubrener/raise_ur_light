import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:raise_ur_light/models/calendar_model.dart';

class CalendarService {
  Future<List<Item>> getWeeklyItems() async {
    Uri url = Uri.parse(
        'https://www.hebcal.com/shabbat?cfg=json&geonameid=3435910&M=on&a=on');

    Response resp = await http
        .get(url, headers: {'Content-Type': 'application/json;charset=UTF-8'});

    Result result = Result.fromRawJson(utf8.decode(resp.bodyBytes));

    List<Item> itemsList = result.items ?? [];

    return itemsList;
  }
}
