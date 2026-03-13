import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Schedule extends StatefulWidget {

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  int ngayDuocChon = -1;

  int thang = 3;
  int nam = 2026;

  List<Map<String, dynamic>> _danhSachSuKien = [
    // sự kiện 1: nộp bài tập môn phân tích thiết kế
    {
      'nam': 2026,
      'thang': 3,
      'ngay': 13,
      'gio': '23:59',
      'tieuDe': "n1".tr(),
      'mauSac': Colors.green,
    },
    // sự kiện 2: làm bài tập giao diện người máy
    {
      'nam': 2026,
      'thang': 3,
      'ngay': 13,
      'gio': '17:00',
      'tieuDe': 'n2'.tr(),
      'mauSac': Colors.grey,
    },
    // sự kiện 3: phòng tự học gdnm
    {
      'nam': 2026,
      'thang': 3,
      'ngay': 10,
      'gio': '9:00-11:00',
      'tieuDe': 'n3'.tr(),
      'mauSac': Colors.orange,
    },
    // sự kiện 4: phòng tự học ltctbdđ
    {
      'nam': 2026,
      'thang': 3,
      'ngay': 10,
      'gio': '13:00-17:00',
      'tieuDe': 'n4',
      'mauSac': Colors.blue,
    },
    // sự kiện 5: nộp báo cáo
    {
      'nam': 2026,
      'thang': 3,
      'ngay': 14,
      'gio': '23:59',
      'tieuDe': 'n5'.tr(),
      'mauSac': Colors.red,
    },
    // sự kiện 6: ngày cá tháng tư
    {
      'nam': 2026,
      'thang': 4,
      'ngay': 1,
      'gio': '24h',
      'tieuDe': 'Ngày Cá tháng Tư',
      'mauSac': Colors.pink,
    },
    // sự kiện 7: pth gdnm
    {
      'nam': 2026,
      'thang': 3,
      'ngay': 11,
      'gio': '9:00-11:00',
      'tieuDe': 'n7'.tr(),
      'mauSac': Colors.deepPurple,
    },
    // sự kiện 8: pth pttk
    {
      'nam': 2026,
      'thang': 3,
      'ngay': 11,
      'gio': '13:00-17:00',
      'tieuDe': 'n8'.tr(),
      'mauSac': Colors.brown,
    },
    // sự kiện 9:
    {
      'nam': 2026,
      'thang': 3,
      'ngay': 12,
      'gio': '10:00-17:00',
      'tieuDe': 'n9',
      'mauSac': Colors.teal,
    },
    // sự kiện 10:
    {
      'nam': 2026,
      'thang': 3,
      'ngay': 13,
      'gio': '10:00-12:00',
      'tieuDe': 'n10'.tr(),
      'mauSac': Colors.cyan,
    },
    // sự kiện 11:
    {
      'nam': 2026,
      'thang': 3,
      'ngay': 13,
      'gio': '13:00-15:00',
      'tieuDe': 'n11'.tr(),
      'mauSac': Colors.lime,
    },
    // sự kiện 12:
    {
      'nam': 2026,
      'thang': 3,
      'ngay': 13,
      'gio': '15:00-17:00',
      'tieuDe': 'n12'.tr(),
      'mauSac': Colors.indigo,
    },
    // sự kiện 13: tập thể dục
    {
      'nam': 2026,
      'thang': 3,
      'ngay': 14,
      'gio': '9:30-17:00',
      'tieuDe': 'n13'.tr(),
      'mauSac': Colors.lightGreen,
    },
  ];

  @override
  Widget build(BuildContext context) {

    int soLuongNgay = DateUtils.getDaysInMonth(nam, thang);

    int thuNgayDau = DateTime(nam, thang, 1).weekday % 7;

    List<Widget> danhSachNgay = [];

    for(int i = 0; i < thuNgayDau; i++){
      danhSachNgay.add(Container());
    }
    DateTime homNay = DateTime.now();

    for(int ngay = 1; ngay <= soLuongNgay; ngay++){

      var suKienTrongNgay = _danhSachSuKien.where((suKien) =>
        suKien['nam'] == nam &&
        suKien['thang'] == thang &&
        suKien['ngay'] == ngay
      ).toList();

      int index = ngay -1;
      bool dangDuocChon = ngayDuocChon == index;

      bool laHomNay =
        ngay == homNay.day &&
        thang == homNay.month &&
        nam == homNay.year;

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
              border: laHomNay ? Border.all(
                color: Colors.green,
                width: 2,
              )
                  : null,
            ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    '$ngay',
                    style: TextStyle(
                      color: dangDuocChon ? Colors.white : Colors.black,
                    ),
                  ),

                  SizedBox(height: 2),

                  // hiển thị chấm sự kiện nếu có
                  if(suKienTrongNgay.isNotEmpty)
                    // hàng chứa các chấm
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // tạo ds tối đa 4 chấm
                      children: List.generate(
                        suKienTrongNgay.length.clamp(0,4),
                          (index) => Container(
                            // khoảng cách và kích thước chấm
                            margin: EdgeInsets.symmetric(horizontal: 1),
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: suKienTrongNgay[index]['mauSac'],
                              shape: BoxShape.circle,
                            ),
                        ),
                      ),
                    )

                ],
              )
          ),
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'lhoc'.tr(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )
        ),
        centerTitle: true,
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
                  onPressed: () {
                    setState(() {
                      thang--;

                      if(thang < 1){
                        thang = 12;
                        nam--;
                      }
                    });
                  },
                ),

                Text(
                  'thang'.tr() + '$thang $nam',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: () {
                    setState(() {
                      thang++;

                      if(thang >12){
                        thang = 1;
                        nam++;
                      }
                    });
                  },
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
                      'chunhat'.tr(),
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'thu2'.tr(),
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'thu3'.tr(),
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'thu4'.tr(),
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'thu5'.tr(),
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'thu6'.tr(),
                      style: TextStyle(
                          fontSize: 12
                      )
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'thu7'.tr(),
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
              // để grid k chiếm toàn màn hình
              shrinkWrap: true,
              // tắt cái chế độ cuộn
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 7,
              //tỉ lệ ô vuông
              childAspectRatio: 1,
              children: danhSachNgay,
            ),

            // đường kẻ ngang
            Divider(),

            SizedBox(
              height: 8
            ),

            Expanded(
              child: Builder(
                builder: (context){

                  // xác định ngày được chọn, nếu =-1 thì mặc định dùng ngày hiện tại
                  int ngayDangXem = ngayDuocChon == -1
                      ? DateTime.now().day
                      : ngayDuocChon + 1;

                  // lọc ds sự kiện theo năm, tháng, ngày đang xem
                  var suKienNgay = _danhSachSuKien.where((suKien) =>
                    suKien['nam'] == nam &&
                    suKien['thang'] == thang &&
                    suKien['ngay'] == ngayDangXem
                  ).toList();

                  if(suKienNgay.isEmpty){
                    return Center(
                      child: Text(
                        'ko'.tr(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: suKienNgay.length,
                    itemBuilder: (context,index){


                      var suKien = suKienNgay[index];

                      return ListTile(
                        leading: Icon(
                          Icons.circle,
                          size: 12,
                          color: suKien['mauSac'],
                        ),
                        title: Text(suKien['tieuDe']),
                        subtitle: Text(suKien['gio']),
                      );
                    },
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
