import 'package:flutter/material.dart';
import 'package:student_study_planner_app/rate/emoticon.dart';

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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12)
                    ),
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
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
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Buồn ngủ',
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
                        camxuc: '😵',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Mất tập trung',
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
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Bình thường',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),

                  //Rất tốt
                  Column(
                    children: [
                      CamXuc(
                        camxuc: '😀',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Rất tốt',
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
                        camxuc: '🚀',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Tập trung',
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
                Container(
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
                            color: Colors.orange,
                            child: Icon(
                              Icons.menu_book,
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
                              'Lập trình cho thiết bị di động',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '2 bài tập',
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
              ],),
            ),
          )
        ],),
      ),
    );
  }
}



// class Home extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Chào mừng bạn đến với trang chủ',
//         style: TextStyle(fontSize: 32),
//       ),
//     );
//   }
// }
