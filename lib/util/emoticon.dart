import 'package:flutter/material.dart';

class CamXuc extends StatelessWidget {

  final String camxuc;

  final bool duocChon;

  //hàm sự kiện khi người dùng bấm vào icon
  final VoidCallback ? onTap;

  const CamXuc({
    Key? key,
    required this.camxuc,
    required this.duocChon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: duocChon ? Colors.blue[700] : Colors.blue[500],
          borderRadius: BorderRadius.circular(12),
          border: duocChon
              ? Border.all(color: Colors.white, width: 3)
              : null,
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
