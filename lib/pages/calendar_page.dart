import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raise_ur_light/models/calendar_model.dart';
import 'package:raise_ur_light/providers/calendar_provider.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  CalendarProvider calendarProvider = CalendarProvider();

  @override
  void initState() {
    calendarProvider = context.read<CalendarProvider>();
    _loadCalendar();
    super.initState();
  }

  void _loadCalendar() async {
    await calendarProvider.getAnualItems();

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Item> itemsList = calendarProvider.itemsList;
    Result result = calendarProvider.result;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        result.title ?? '',
      )),
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
