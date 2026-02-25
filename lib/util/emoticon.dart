import 'package:flutter/material.dart';

class CamXuc extends StatelessWidget {

  final String camxuc;
  const CamXuc({
    Key? key,
    required this.camxuc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
