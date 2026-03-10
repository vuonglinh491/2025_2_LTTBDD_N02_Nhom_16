import 'package:flutter/material.dart';

class CamXuc extends StatefulWidget {

  final String camxuc;

  const CamXuc({
    Key? key,
    required this.camxuc,
  }) : super(key: key);

  @override
  State<CamXuc> createState() => _CamXucState();
}

class _CamXucState extends State<CamXuc> {

  bool dangClick = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        setState(() {
          dangClick = !dangClick;
        });
      },

      child: Container(
        decoration: BoxDecoration(
          // color: Colors.blue[500],
          color: dangClick ? Colors.orange : Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(12),
        child: Text(
          widget.camxuc,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
