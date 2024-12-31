import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raise_ur_light/models/calendar_model.dart';
import 'package:raise_ur_light/providers/calendar_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  CalendarProvider calendarProvider = CalendarProvider();

  @override
  void initState() {
    calendarProvider = context.read<CalendarProvider>();
    _loadCalendar();
    super.initState();
  }

  void _loadCalendar() async {
    await calendarProvider.getWeeklyItems();

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Item> itemsList = calendarProvider.itemsList;

    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: ((context, index) => ListTile(
                  title: Text(itemsList[index].title ?? 'data'),
                  leading: Icon(Icons.home),
                ))),
      ),
    );
  }
}
