import 'package:flutter/material.dart';
import 'package:raise_ur_light/models/calendar_model.dart';
import 'package:raise_ur_light/services/calendar_service.dart';

class CalendarProvider extends ChangeNotifier {
  Result result = Result();
  List<Item> itemsList = [];

  CalendarService service = CalendarService();

  getWeeklyItems() async {
    result = await service.getWeeklyItems();
    itemsList = result.items ?? [];
    notifyListeners();
  }

  getAnualItems() async {
    result = await service.getAnualItems();
    itemsList = result.items ?? [];
    notifyListeners();
  }
}
