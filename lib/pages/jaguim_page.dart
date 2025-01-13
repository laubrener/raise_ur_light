import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raise_ur_light/models/calendar_model.dart';
import 'package:raise_ur_light/providers/calendar_provider.dart';

class JaguimPage extends StatefulWidget {
  const JaguimPage({Key? key}) : super(key: key);

  @override
  State<JaguimPage> createState() => _JaguimPageState();
}

class _JaguimPageState extends State<JaguimPage> with TickerProviderStateMixin {
  CalendarProvider calendarProvider = CalendarProvider();
  List holidays = [];

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

    // for (var e in itemsList) {
    //   if (e.category == Category.HOLIDAY) {
    //     holidays.add(itemsList.firstWhere((element) => element.memo == e.memo));
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
          title: Text(
        result.title ?? '',
      )),
      body: Center(
        child: ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: ((context, index) =>
                itemsList[index].subcat == Subcat.MAJOR
                    ? ListTile(
                        title: Text(itemsList[index].title ?? 'data'),
                        leading: Icon(Icons.home),
                        // subtitle: Text(itemsList[index].memo ?? ''),
                        trailing: Text(itemsList[index].dateString()),
                      )
                    : Container())),
      ),
    );
  }
}
