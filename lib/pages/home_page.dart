import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raise_ur_light/models/calendar_model.dart';
import 'package:raise_ur_light/models/date_model.dart';
import 'package:raise_ur_light/models/today_model.dart';
import 'package:raise_ur_light/providers/calendar_provider.dart';
import 'package:intl/intl.dart';

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
    await calendarProvider.getDate();
    await calendarProvider.getTodayTimes();
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
    HebrewDate date = calendarProvider.date;
    Times times = calendarProvider.times;
    final String now = DateTime.now().toString().split(' ')[0];
    final String formattedDate = DateFormat.yMMMEd().format(DateTime.now());
    // DateFormat('EEEE, d \'de\' MMMM \'de\' y', 'es_ES').format(now);
    List timesList = times.toJson().entries.toList();
    String currentTime = DateFormat.Hm().format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
          title: Text(
        date.dateString(),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          'alot hashachar',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          currentTime,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      now,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      '${formattedDate}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  IconButton(
                      // DateFormat.yMMMEd().format(DateTime.now())
                      //  DateFormat.Hm().format(DateTime.now())
                      onPressed: () => print(timesList),
                      icon: Icon(Icons.favorite)),
                ],
              ),
            ),
            Zmanim(timesList: timesList),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.red,
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}

class Zmanim extends StatelessWidget {
  const Zmanim({
    super.key,
    required this.timesList,
  });

  final List timesList;

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    String parsedTime(int i) {
      return DateFormat.Hm().format(DateTime.parse(
              timesList[i].value.first ?? "2025-01-09T01:01:00-03:00")
          .toLocal());
    }

    return Container(
      // height: MediaQuery.sizeOf(context).height * .75,
      width: MediaQuery.sizeOf(context).height * .36,
      color: Colors.grey.shade200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: timesList.length,
        itemBuilder: ((context, i) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    timesList[i].value.last,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: currentTime.isBefore(DateTime.parse(
                                    timesList[i].value.first ??
                                        "2025-01-09T01:01:00-03:00")
                                .toLocal())
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ),
                Container(
                  child: Text(
                    parsedTime(i),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: currentTime.isBefore(DateTime.parse(
                                    timesList[i].value.first ??
                                        "2025-01-09T01:01:00-03:00")
                                .toLocal())
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}


// Container(
//               height: MediaQuery.sizeOf(context).height * .75,
//               child: ListView.builder(
//                 itemCount: timesList.length,
//                 itemBuilder: ((context, i) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         // padding: const EdgeInsets.all(20),
//                         child: Text(
//                           timesList[i].key,
//                           style: TextStyle(
//                             fontSize: 16,
//                             // fontWeight: parsedTime(i) > currentTime
//                             //     ? FontWeight.bold
//                             //     : FontWeight.normal
//                           ),
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(20),
//                         child: Text(
//                           parsedTime(i),
//                           style: const TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//               ),
//             )