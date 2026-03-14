import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  int totalSeconds = 600;
  int remainingSeconds = 600;

  Timer? timer;
  bool isRunning = false;
  bool isPaused = false;

  /// TIME PICKER (DAY - HOUR - MINUTE)
  void openTimePicker() {
    int selectedDay = 0;
    int selectedHour = (totalSeconds % 86400) ~/ 3600;
    int selectedMinute = (totalSeconds % 3600) ~/ 60;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// DAY
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedDay,
                  ),
                  onSelectedItemChanged: (value) {
                    selectedDay = value;
                  },
                  children: List.generate(
                    30,
                    (index) => Center(child: Text("${"ngay".tr()}")),
                  ),
                ),
              ),

              /// HOUR
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedHour,
                  ),
                  onSelectedItemChanged: (value) {
                    selectedHour = value;
                  },
                  children: List.generate(
                    24,
                    (index) => Center(child: Text("${"gio".tr()}")),
                  ),
                ),
              ),

              /// MINUTE
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedMinute,
                  ),
                  onSelectedItemChanged: (value) {
                    selectedMinute = value;
                  },
                  children: List.generate(
                    60,
                    (index) => Center(child: Text("${"phut".tr()}")),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      int seconds =
          (selectedDay * 86400) + (selectedHour * 3600) + (selectedMinute * 60);

      setState(() {
        totalSeconds = seconds;
        remainingSeconds = seconds;
      });
    });
  }

  /// START TIMER
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        t.cancel();
        setState(() {
          isRunning = false;
          isPaused = false;
        });
      }
    });

    setState(() {
      isRunning = true;
      isPaused = false;
    });
  }

  /// PAUSE
  void pauseTimer() {
    timer?.cancel();
    setState(() {
      isPaused = true;
      isRunning = false;
    });
  }

  /// RESUME
  void resumeTimer() {
    startTimer();
  }

  /// CANCEL
  void cancelTimer() {
    timer?.cancel();
    setState(() {
      remainingSeconds = totalSeconds;
      isRunning = false;
      isPaused = false;
    });
  }

  /// FORMAT TIME (DAY : HOUR : MINUTE : SECOND)
  String formatTime(int seconds) {
    int days = seconds ~/ 86400;
    int hours = (seconds % 86400) ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;

    if (days > 0) {
      return "$days d ${hours.toString().padLeft(2, '0')}:"
          "${minutes.toString().padLeft(2, '0')}:"
          "${secs.toString().padLeft(2, '0')}";
    }

    return "${hours.toString().padLeft(2, '0')}:"
        "${minutes.toString().padLeft(2, '0')}:"
        "${secs.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    double progress = remainingSeconds / totalSeconds;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Taptrung".tr(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff3566D6),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/language/imgs/image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// TIMER CIRCLE
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 10,
                      backgroundColor: Colors.blue[100],
                      color: Colors.blue,
                    ),
                  ),

                  /// TAP TO CHANGE TIME
                  GestureDetector(
                    onTap: () {
                      if (!isRunning) {
                        openTimePicker();
                      }
                    },
                    child: Text(
                      formatTime(remainingSeconds),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            /// BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isRunning && !isPaused)
                  ElevatedButton(
                    onPressed: startTimer,
                    child: Text("${"bd".tr()}"),
                  ),

                if (isRunning)
                  ElevatedButton(
                    onPressed: pauseTimer,
                    child: Text("${"td".tr()}"),
                  ),

                if (isPaused)
                  ElevatedButton(
                    onPressed: resumeTimer,
                    child: Text("${"tt".tr()}"),
                  ),

                const SizedBox(width: 20),

                if (isRunning || isPaused)
                  ElevatedButton(
                    onPressed: cancelTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text("${"huy".tr()}"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
