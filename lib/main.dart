import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raise_ur_light/pages/calendar_page.dart';
import 'package:raise_ur_light/pages/home_page.dart';
import 'package:raise_ur_light/pages/main_page.dart';
import 'package:raise_ur_light/providers/calendar_provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalendarProvider()),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raise ur Light',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: true),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainPage(),
    );
  }
}
