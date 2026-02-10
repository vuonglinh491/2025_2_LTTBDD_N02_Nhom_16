import 'package:flutter/material.dart';
import 'package:student_study_planner_app/pages/add.dart';
import 'package:student_study_planner_app/pages/home.dart';
import 'package:student_study_planner_app/pages/schedule.dart';
import 'package:student_study_planner_app/pages/settings.dart';
import 'package:student_study_planner_app/pages/tasks.dart';

void main(){
  runApp(
    MaterialApp(
      home: TrangChu(),
    )
  );
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
    Add(),
    Tasks(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectIndex],
      // body: Center(
      //   child: Text(
      //     'Chào mừng bạn đến với trang chủ',
      //     style: TextStyle(fontSize: 32),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Lịch học'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Nhiệm vụ'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Cài đặt'),
        ],
        backgroundColor: Colors.blue,
      ),
    );
  }
}

