import 'dart:async';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  // ================= BIẾN =================

  int totalSeconds = 600; // 10 phút mặc định
  int remainingSeconds = 600;

  Timer? timer;
  bool isRunning = false;
  bool isPaused = false;

  // ================= HÀM START =================

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

  // ================= HÀM PAUSE =================

  void pauseTimer() {
    timer?.cancel();
    setState(() {
      isPaused = true;
      isRunning = false;
    });
  }

  // ================= HÀM RESUME =================

  void resumeTimer() {
    startTimer();
  }

  // ================= HÀM CANCEL =================

  void cancelTimer() {
    timer?.cancel();
    setState(() {
      remainingSeconds = totalSeconds;
      isRunning = false;
      isPaused = false;
    });
  }

  // ================= FORMAT TIME =================

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:"
        "${secs.toString().padLeft(2, '0')}";
  }

  // ================= BUILD UI =================

  @override
  Widget build(BuildContext context) {
    double progress = remainingSeconds / totalSeconds;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text("Tập trung"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ===== VÒNG TRÒN =====
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
                Text(
                  formatTime(remainingSeconds),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // ===== SLIDER CHỈNH THỜI GIAN =====
          if (!isRunning && !isPaused)
            Column(
              children: [
                const Text("Chọn thời gian (phút)"),
                Slider(
                  min: 1,
                  max: 60,
                  divisions: 59,
                  value: totalSeconds / 60,
                  label: "${totalSeconds ~/ 60} phút",
                  onChanged: (value) {
                    setState(() {
                      totalSeconds = value.toInt() * 60;
                      remainingSeconds = totalSeconds;
                    });
                  },
                ),
              ],
            ),

          const SizedBox(height: 20),

          // ===== NÚT CHỨC NĂNG =====
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isRunning && !isPaused)
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text("Bắt đầu"),
                ),

              if (isRunning)
                ElevatedButton(
                  onPressed: pauseTimer,
                  child: const Text("Tạm dừng"),
                ),

              if (isPaused)
                ElevatedButton(
                  onPressed: resumeTimer,
                  child: const Text("Tiếp tục"),
                ),

              const SizedBox(width: 20),

              if (isRunning || isPaused)
                ElevatedButton(
                  onPressed: cancelTimer,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Hủy"),
                ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= QUAN TRỌNG =================
  // Hủy timer khi rời màn hình tránh memory leak

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
