import 'package:flutter/material.dart';
import 'package:student_study_planner_app/util/courses.dart';
import 'package:student_study_planner_app/util/emoticon.dart';
import 'package:student_study_planner_app/pages/notification.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3566D6),
      body: SafeArea(
        child: Column(children: [

          //phần tiêu đề
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [
              //a hàng chào mừng (2 cột sát 2 lề)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //a11 cột văn bản (2 hàng)
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Nguyễn Văn A!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                        height: 8,
                      ),

                      Text(
                        '20 Feb,2026',
                        style: TextStyle(
                            color: Colors.blue[200]
                        ),
                      ),
                    ],
                  ),

                  //a12 cột thông báo
                  InkWell(
                    onTap: () {
                      // Xử lý sự kiện khi nhấn vào biểu tượng thông báo
                      // Ví dụ: Điều hướng đến trang thông báo
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrangThongBao(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.notifications, color: Colors.white),
                    ),
                  ),
                ],),

              SizedBox(
                height: 25,
              ),

              //b phần tìm kiếm
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[500],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),

                    SizedBox(
                      width: 8,
                    ),

                    Text(
                      'Tìm kiếm...',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 25,
              ),

              //c phần khảo sát cảm xúc
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    'Hôm nay bạn thấy thế nào?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  )
                ],
              ),

              SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //k tập trung được
                  Column(
                    children: [
                      CamXuc(
                        camxuc: '😴',
                        onTap: () {
                          print("Hãy nghỉ ngơi rồi bắt đầu nhé");
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Mệt mỏi',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),

                  //Khó tập trung
                  Column(
                    children: [
                      CamXuc(
                        camxuc: '😣',
                        onTap: () {
                          print("Hít một hơi thật sâu rồi bắt đầu nhé");
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Áp lực',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),

                  //Bình thường
                  Column(
                    children: [
                      CamXuc(
                        camxuc: '😐',
                        onTap: () {
                          print("Chúc bạn sớm hoàn thành nhiệm vụ");
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Bình ổn',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),

                  //Khá tốt
                  Column(
                    children: [
                      CamXuc(
                        camxuc: '🔥',
                        onTap: () {
                          print("CÙng bắt tay vào học bài ngay nào");
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Hăng say',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),

                  //Sẵn sàng
                  Column(
                    children: [
                      CamXuc(
                        camxuc: '💪',
                        onTap: () {
                          print("Sẵn sàng cho các nhiệm vụ mới nào");
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Tự tin',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],),
          ),

          //phần nd
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              color: Colors.grey[200],
              child: Column(children: [

                // Tiêu đề nd
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Các khóa học',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Icon(Icons.more_horiz),
                  ],
                ),

                SizedBox(
                  height: 25,
                ),

                // Xem danh sách nd
                Expanded(
                  child: ListView(
                    children: [
                      KhoaHoc(
                        BieuTuong: Icons.phone_android,
                        TenKhoaHoc: 'Lập trình cho thiết bị di động',
                        SoBaiTap: 5,
                        MauSac: Colors.blueAccent,
                      ),
                      KhoaHoc(
                        BieuTuong: Icons.account_tree,
                        TenKhoaHoc: 'Phân tích và thiết kế phần mềm',
                        SoBaiTap: 56,
                        MauSac: Colors.deepPurple,
                      ),
                      KhoaHoc(
                        BieuTuong: Icons.touch_app,
                        TenKhoaHoc: 'Giao diện người máy',
                        SoBaiTap: 12,
                        MauSac: Colors.orange,
                      ),
                      KhoaHoc(
                        BieuTuong: Icons.functions,
                        TenKhoaHoc: 'Tối ưu hóa',
                        SoBaiTap: 9,
                        MauSac: Colors.redAccent,
                      ),
                      KhoaHoc(
                        BieuTuong: Icons.menu_book,
                        TenKhoaHoc: 'Tiếng anh 2',
                        SoBaiTap: 5,
                        MauSac: Colors.teal,
                      ),
                    ],
                  ),
                ),
              ],),
            ),
          )
        ],),
      ),
    );
  }
}
