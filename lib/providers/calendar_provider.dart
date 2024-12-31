import 'package:flutter/material.dart';
import 'package:raise_ur_light/models/calendar_model.dart';
import 'package:raise_ur_light/services/calendar_service.dart';

class CalendarProvider extends ChangeNotifier {
  List<Item> itemsList = [];

  CalendarService service = CalendarService();

  getWeeklyItems() async {
    itemsList = await service.getWeeklyItems();
    notifyListeners();
  }
}
