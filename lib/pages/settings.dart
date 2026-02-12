import 'package:flutter/material.dart';
import 'package:student_study_planner_app/main.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;
  int hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HEADER =================
            Container(
              padding: const EdgeInsets.only(
                top: 60,
                left: 20,
                right: 20,
                bottom: 30,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff3566D6),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.person_outline, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    "Cài đặt",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= CARD THÔNG TIN =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xffC8D4E8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Color(0xff3566D6),
                          child: Text(
                            "N",
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nguyễn Văn A",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text("Sinh viên"),
                            Text("SV123456"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    const Row(
                      children: [
                        Icon(Icons.email_outlined),
                        SizedBox(width: 10),
                        Text("nguyenvana@student.edu.vn"),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        Icon(Icons.menu_book_outlined),
                        SizedBox(width: 10),
                        Text("Công nghệ Thông tin"),
                      ],
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                        label: const Text("Chỉnh sửa hồ sơ"),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: const BorderSide(color: Color(0xff3566D6)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ================= CÀI ĐẶT CHUNG =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cài đặt chung",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _settingItem(Icons.person_outline, "Cài đặt chung"),
                    _settingItem(Icons.notifications_none, "Thông báo"),
                    SwitchListTile(
                      secondary: const CircleAvatar(
                        backgroundColor: Color(0xffE6ECF8),
                        child: Icon(Icons.dark_mode, color: Color(0xff3566D6)),
                      ),
                      title: const Text("Chế độ tối"),
                      value: isDarkMode,
                      onChanged: (val) {
                        setState(() {
                          isDarkMode = val;
                        });

                        // Gọi đổi theme toàn app
                        MyApp.of(context)?.changeTheme(val);
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),
            // ================= THÔNG TIN NHÀ PHÁT TRIỂN =================
            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Thông tin nhà phát triển",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===== Sinh viên =====
                    const Row(
                      children: [
                        Icon(Icons.school_outlined, color: Color(0xff3566D6)),
                        SizedBox(width: 8),
                        Text(
                          "Sinh viên",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Ngô Vương Linh",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      "Mã sinh viên: 23010496",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      "Nguyễn Kiều Trang",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      "Mã sinh viên: 23010495",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    // ===== Giảng viên =====
                    const Row(
                      children: [
                        Icon(Icons.person_outline, color: Color(0xff3566D6)),
                        SizedBox(width: 8),
                        Text(
                          "Giảng viên hướng dẫn",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Nguyễn Xuân Quế",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),

            // ================= ĐÁNH GIÁ =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      "Đánh giá ứng dụng",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Cảm ơn bạn đã sử dụng Study Planner!",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              hoverIndex = index;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              hoverIndex = -1;
                            });
                          },
                          child: Icon(
                            index <= hoverIndex
                                ? Icons.star
                                : Icons.star_border,
                            size: 32,
                            color: index <= hoverIndex
                                ? Colors.amber
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ================= VERSION =================
            const Text(
              "Study Planner App\nVersion 1.0.0",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _settingItem(IconData icon, String title) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xffE6ECF8),
        child: Icon(icon, color: const Color(0xff3566D6)),
      ),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
