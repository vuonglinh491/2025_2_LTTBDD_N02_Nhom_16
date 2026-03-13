import 'package:flutter/material.dart';

class CamXuc extends StatelessWidget {

  final String camxuc;
  //hàm sự kiện khi người dùng bấm vào icon
  final VoidCallback ? onTap;

  const CamXuc({
    Key? key,
    required this.camxuc,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[500],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(12),
        child: Text(
          camxuc,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
