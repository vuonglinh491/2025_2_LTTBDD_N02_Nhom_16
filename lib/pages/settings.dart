import 'package:flutter/material.dart';
import 'package:student_study_planner_app/main.dart';
import 'package:easy_localization/easy_localization.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F7),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_outline, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    "caidat".tr(),
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
                      children: [
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
                              "nguyen".tr(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text("sv".tr()),
                            Text("msv".tr()),
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
                    Row(
                      children: [
                        Icon(Icons.menu_book_outlined),
                        SizedBox(width: 10),
                        Text("cntt".tr()),
                      ],
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                        label: Text("cshs".tr()),
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

             Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "cdc".tr(),
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
                    _settingItem(Icons.person_outline, "cdc".tr()),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xffE6ECF8),
                        child: Icon(Icons.language, color: Color(0xff3566D6)),
                      ),
                      title: Text("nn".tr()),
                      subtitle: Text(
                        context.locale.languageCode == 'vi'
                            ? "Tiếng Việt"
                            : "English",
                      ),
                      trailing: DropdownButton<String>(
                        value: context.locale.languageCode,
                        underline: const SizedBox(),
                        items: const [
                          DropdownMenuItem(
                            value: 'vi',
                            child: Text("Tiếng Việt"),
                          ),
                          DropdownMenuItem(value: 'en', child: Text("English")),
                        ],
                        onChanged: (value) {
                          if (value == 'vi') {
                            context.setLocale(const Locale('vi'));
                          } else {
                            context.setLocale(const Locale('en'));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const SizedBox(height: 10),

             Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "npt".tr(),
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
                    // sinh vien
                     Row(
                      children: [
                        Icon(Icons.school_outlined, color: Color(0xff3566D6)),
                        SizedBox(width: 8),
                        Text(
                          "sv".tr(),
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "nvl".tr(),
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "masv".tr() + "23010496",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "nkt".tr(),
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "masv".tr() + "23010495",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    // giảng viên
                    Row(
                      children: [
                        Icon(Icons.person_outline, color: Color(0xff3566D6)),
                        SizedBox(width: 8),
                        Text(
                          "gv".tr(),
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "nxq".tr(),
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 25),
            // phânf đánh giá
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
                      "dg".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "camon".tr(),
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
