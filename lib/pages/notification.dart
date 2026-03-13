import 'package:flutter/material.dart';

// lớp đại diện cho một deadline (hạn chót)
class HanChot {

  final String tieuDe;
  final String ngayHan;
  // hàm khởi tạo với tiêu đề và ngày hạn chót
  const HanChot(this.tieuDe, this.ngayHan);
}

// lớp hiển thị danh sách các deadline
class TrangThongBao extends StatelessWidget {
  const TrangThongBao({super.key});

  // danh sách các deadline mẫu để hiển thị
  final List<HanChot> _danhSachHanChot = const [
    HanChot(
      'PTTK: Báo cáo',
      '13/3/2026 11:00 PM',
    ),
    HanChot(
      'LTDĐ: Báo cáo',
      '14/3/2026 11:00 PM',
    ),
    HanChot(
      'GDNM: figma',
      '13/3/2026 11:00 PM',
    ),
    HanChot(
      'PTTK: Buổi bảo vệ báo cáo',
      '16/3/2026 8:00 AM - 5:00 PM',
    ),
    HanChot(
      'LTDĐ: Báo cáo bản cứng',
      '18/3/2026 8:00 AM - 5:00 PM',
    ),
    HanChot(
      'GDNM: Poster, báo cáo cuối kỳ',
      '17/3/2026 8:00 AM - 5:00 PM',
    ),
    HanChot(
      'Tối ưu hóa: Thi cuối kì',
      '18/3/2026 6:30 PM - 8:00 PM',
    ),
  ];

  @override
  Widget build(BuildContext nguCanhXayDung) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'THÔNG BÁO',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff3566D6),
      ),

      // phần thân trang chứa danh sách thông báo
      body: ListView.separated(
        padding: const EdgeInsets.all(16),

        // số lượng phần tử trong danh sách
        itemCount: _danhSachHanChot.length,
        // widget phân cách giữa các phần tử
        separatorBuilder: (_, __) => Divider(),
        // hàm xây dựng từng phần tử trong danh sách
        itemBuilder: (nguCanhXayDung, chiSo) {
          // lấy mục deadline tại vị trí hiện tại
          final mucHanChot = _danhSachHanChot[chiSo];
          // trả về hàng chứa thông tin deadline
          return Row(
            // căn chỉnh từ đầu hàng
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // biểu tượng lịch bên trái
              Icon(Icons.calendar_today, color: Colors.grey[700]),
              // khoảng cách 12 pixel giữa icon và nội dung
              SizedBox(width: 12),
              // widget mở rộng chứa tiêu đề và ngày
              Expanded(
                // cột chứa tiêu đề và ngày hạn chót
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // tiêu đề deadline
                    Text(mucHanChot.tieuDe, style: TextStyle(fontSize: 16)),
                    // khoảng cách 4 pixel
                    SizedBox(height: 4),
                    // ngày hạn chót với màu xám
                    Text(
                      mucHanChot.ngayHan,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
