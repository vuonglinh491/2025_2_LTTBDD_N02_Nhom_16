import 'package:flutter/material.dart';

class KhoaHoc extends StatelessWidget {

  final BieuTuong;
  final String TenKhoaHoc;
  final int SoBaiTap;
  final MauSac;

  const KhoaHoc({
    Key? key,
    required this.BieuTuong,
    required this.TenKhoaHoc,
    required this.SoBaiTap,
    required this.MauSac,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: MauSac,
                  child: Icon(
                    BieuTuong,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TenKhoaHoc,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    SoBaiTap.toString() + ' bài tập',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ],),

            Icon(Icons.more_horiz),
          ],
        )
      ),
    );
  }
}

