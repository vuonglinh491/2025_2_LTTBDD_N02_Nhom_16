import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  int ngayDuocChon = -1;

  int thang = 3;
  int nam = 2026;

  @override
  Widget build(BuildContext context) {

    int soLuongNgay = DateUtils.getDaysInMonth(nam, thang);

    int thuNgayDau = DateTime(nam, thang, 1).weekday % 7;

    List<Widget> danhSachNgay = [];

    for(int i = 0; i < thuNgayDau; i++){
      danhSachNgay.add(Container());
    }

    for(int ngay = 1; ngay <= soLuongNgay; ngay++){
      int index = ngay -1;
      bool dangDuocChon = ngayDuocChon == index;

      danhSachNgay.add(
        GestureDetector(
          onTap: (){
            setState(() {
              ngayDuocChon = index;
            });
          },

          child: Container(
            margin: EdgeInsets.all(4),

            decoration: BoxDecoration(
              color: dangDuocChon ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),

            child: Center(
              child: Text(
                '$ngay',
                style: TextStyle(
                  // fontSize: 14,
                  color: dangDuocChon ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lịch học',
          style: TextStyle(
            color: Colors.white,
          )
        ),
        backgroundColor: Color(0xff3566D6),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () {},
                ),

                Text(
                  'Tháng $thang $nam',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: () {},
                ),

              ],
            ),

            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Chủ nhật',
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Thứ 2',
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Thứ 3',
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Thứ 4',
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Thứ 5',
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Thứ 6',
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Thứ 7',
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
              ],
            ),

            SizedBox(height: 8),

            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 7,
              childAspectRatio: 1,
              children: danhSachNgay,
            ),


          ],
        ),
      ),
    );
  }
}
