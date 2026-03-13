import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  // danh sách dữ liệu mẫu chứa các nhiệm vụ cần hoàn thành
  final List<Map<String, String>> _danhSachNhiemVu = const [
    // nhiệm vụ 1:
    {'tieuDe': 'Nộp bài toán học',
      'hanChot': '12/03/2026 23:59'},
    // nhiệm vụ 2:
    {'tieuDe': 'Chuẩn bị bài thuyết trình',
      'hanChot': '15/03/2026 10:00'},
    // nhiệm vụ 3:
    {'tieuDe': 'Mua sách mới',
      'hanChot': '18/03/2026 17:00'},
    // nhiệm vụ 4:
    {'tieuDe': 'Gửi báo cáo thực tập',
      'hanChot': '20/03/2026 12:00'},
    // nhiệm vụ 5:
    {'tieuDe': 'Đăng ký môn học',
      'hanChot': '25/03/2026 00:00'},
  ];

  @override
  Widget build(BuildContext nguCanhXayDung) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NHIỆM VỤ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff3566D6),
      ),

      // list ds nhiệm vụ
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _danhSachNhiemVu.length,
        // widget phân cách giữa các phần tử
        separatorBuilder: (_, __) => const Divider(),
        // hàm xây dựng từng phần tử trong danh sách
        itemBuilder: (nguCanhXayDung, chiSo) {
          // lấy dữ liệu nhiệm vụ tại vị trí hiện tại
          final mucNhiemVu = _danhSachNhiemVu[chiSo];
          // trả về widget ListTile để hiển thị nhiệm vụ
          return ListTile(
            leading: const Icon(Icons.task),
            // tiêu đề nhiệm vụ
            title: Text(
              mucNhiemVu['tieuDe']!,
              style: const TextStyle(fontSize: 16),
            ),
            // phụ đề hiển thị hạn chót
            subtitle: Text(
              '${'Hạn '}: ${mucNhiemVu['hanChot']}',
              style: const TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
