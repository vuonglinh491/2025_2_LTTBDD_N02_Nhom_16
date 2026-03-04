import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //chia làm 2 phần cho lịch và nhiệm vụ
              Container(
                height: 300,
                padding: EdgeInsets.all(25),
                color: Colors.orange,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Lịch học",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  color: Colors.grey[200],
                ),
              )
            ],
          )
      ),
    );
  }
}
