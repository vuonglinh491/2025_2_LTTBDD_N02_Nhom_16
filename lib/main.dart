import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:student_study_planner_app/pages/add.dart';
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
      path: 'assets/language', // thư mục chứa file ngôn ngữ
      fallbackLocale: const Locale('vi'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void changeTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Dark / Light mode
      themeMode: _themeMode,

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
      ),

      // Localization
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,

      home: const TrangChu(),
    );
  }
}

class TrangChu extends StatefulWidget {
  const TrangChu({super.key});

  @override
  State<TrangChu> createState() => _TrangChuState();
}

class _TrangChuState extends State<TrangChu> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    Home(),
    Schedule(),
    Add(),
    Tasks(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'trang_chu'.tr(),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_today),
            label: 'lich_hoc'.tr(),
          ),

          const BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),

          BottomNavigationBarItem(
            icon: const Icon(Icons.task),
            label: 'nhiem_vu'.tr(),
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'cai_dat'.tr(),
          ),
        ],
      ),
    );
  }
}
