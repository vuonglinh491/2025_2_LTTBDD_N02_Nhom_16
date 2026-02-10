import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Đây là danh sách nhiệm vụ',
        style: TextStyle(fontSize: 32),
      ),
    );
  }
}
