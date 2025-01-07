import 'package:flutter/material.dart';
import 'package:raise_ur_light/pages/calendar_page.dart';
import 'package:raise_ur_light/pages/home_page.dart';
import 'package:raise_ur_light/pages/jaguim_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 1;

  List<Widget> bottomNavRoutes = [
    const CalendarPage(),
    const HomePage(),
    const JaguimPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavRoutes[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_outlined),
              label: "Calendar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_outlined),
              label: "Today",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_outlined),
              label: "Jaguim",
            ),
          ]),
    );
  }
}
