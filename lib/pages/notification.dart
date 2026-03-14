import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; // thư viện hỗ trợ ngôn ngữ

// lớp đại diện cho một deadline (hạn chót)
class HanChot {
  final String tieuDe;
  final String ngayHan;
  // hàm khởi tạo với tiêu đề và ngày hạn chót
  const HanChot(this.tieuDe, this.ngayHan);
}

// lớp hiển thị danh sách các deadline
class TrangThongBao extends StatelessWidget {
  TrangThongBao({super.key});

  // danh sách các deadline mẫu để hiển thị
  final List<HanChot> _danhSachHanChot = [
    HanChot('bc1'.tr(), '13/3/2026 11:00 PM'),
    HanChot('bc2'.tr(), '14/3/2026 11:00 PM'),
    HanChot('bc3'.tr(), '13/3/2026 11:00 PM'),
    HanChot('bc4'.tr(), '16/3/2026 8:00 AM - 5:00 PM'),
    HanChot('bc5'.tr(), '18/3/2026 8:00 AM - 5:00 PM'),
    HanChot('bc6', '17/3/2026 8:00 AM - 5:00 PM'),
    HanChot('bc7', '18/3/2026 6:30 PM - 8:00 PM'),
  ];

  @override
  Widget build(BuildContext nguCanhXayDung) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'tb'.tr(),
          style: TextStyle(fontSize: 20, color: Colors.white),
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

          // lấy chuỗi ngày (bỏ phần giờ thứ 2 nếu có)
          String chuoiNgay = mucHanChot.ngayHan.split('-')[0];

          // chuyển chuỗi ngày thành kiểu DateTime để so sánh
          DateTime ngayHan = DateFormat("d/M/yyyy HH:mm").parse(mucHanChot.ngayHan);

          // lấy ngày hiện tại
          DateTime homNay = DateTime.now();

          // bỏ phần giờ để chỉ so sánh ngày
          DateTime ngayHomNay = DateTime(homNay.year, homNay.month, homNay.day);
          DateTime ngayDeadline = DateTime(ngayHan.year, ngayHan.month, ngayHan.day);

          // biến lưu màu nền
          Color? mauNen;

          //nếu deadline là hôm nay thì nền đỏ nhạt
          if (ngayDeadline.year == ngayHomNay.year &&
              ngayDeadline.month == ngayHomNay.month &&
              ngayDeadline.day == ngayHomNay.day){
            mauNen = Colors.red.withOpacity(0.15);
          }
          //nếu deadline sau hôm nay thì nền xanh dương nhạt
          else if (ngayDeadline.isAfter(ngayHomNay)) {
            mauNen = Colors.blue.withOpacity(0.15);
          }
          //nếu deadline đã qua thì sẽ không có nền
          else {
            mauNen = null;
          }

          return Container(

            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),

            // màu nền theo trạng thái deadline
            decoration: BoxDecoration(
              color: mauNen,
              borderRadius: BorderRadius.circular(10),
            ),

            child: Row(
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
            ),
          );
        },
      ),
    );
  }
}
