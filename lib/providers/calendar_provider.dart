import 'package:flutter/material.dart';
import 'package:raise_ur_light/models/calendar_model.dart';
import 'package:raise_ur_light/models/date_model.dart';
import 'package:raise_ur_light/models/today_model.dart';
import 'package:raise_ur_light/services/calendar_service.dart';

class CalendarProvider extends ChangeNotifier {
  Result result = Result();
  List<Item> itemsList = [];
  Times times = Times();
  HebrewDate date = HebrewDate();

  CalendarService service = CalendarService();

  getWeeklyItems() async {
    result = await service.getWeeklyItems();
    itemsList = result.items ?? [];
    notifyListeners();
  }

  getDate() async {
    date = await service.getDate();

    notifyListeners();
  }

  getTodayTimes() async {
    Today today = await service.getTodayTimes();
    times = today.times ?? Times();

    notifyListeners();
  }

  getAnualItems() async {
    result = await service.getAnualItems();
    itemsList = result.items ?? [];
    notifyListeners();
  }
}
