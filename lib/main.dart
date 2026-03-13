import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:student_study_planner_app/pages/focuspage.dart';
import 'package:student_study_planner_app/pages/home.dart';
import 'package:student_study_planner_app/pages/schedule.dart';
import 'package:student_study_planner_app/pages/settings.dart';
import 'package:student_study_planner_app/pages/tasks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('vi'), Locale('en')],
      path: 'assets/language',
      fallbackLocale: const Locale('vi'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,

      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),

      home: const TrangChu(),
    );
  }

  static of(BuildContext context) {}
}

class TrangChu extends StatefulWidget {
  const TrangChu({super.key});

  @override
  State<TrangChu> createState() => _TrangChuState();
}

class _TrangChuState extends State<TrangChu> {
  int _selectIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  final List<Widget> _page = [
    Home(),
    Schedule(),
    FocusPage(),
    Tasks(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_today),
            label: 'schedule'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.local_fire_department),
            label: 'focus'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.task),
            label: 'tasks'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'settings'.tr(),
          ),
        ],
      ),
    );
  }
}
