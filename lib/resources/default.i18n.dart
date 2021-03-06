import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  String get i18n => localize(this, _t);
  static var _t = Translations.byLocale("en_us") +
      {
        "vi_vn": {
          "Wrong yet!": "Chưa chính xác!",
          "Awesome!": "Tuyệt vời!",
          "Next": "Tiếp tục",
          "Check": "Kiểm tra",
          "Choose Grade": "Chọn lớp",
          "Choose Subject": "Chọn môn",
          "Thống kê": "Statistic",
          "Close": "Đóng",
          "Ignore": "Bỏ qua",
          "Login": "Đăng nhập",
          "Password": "Mật khẩu",
          "Login name": "Tên đăng nhập",
          "Home": "Trang chủ",
          "Notifications": "Thông báo",
          "Profile": "Cá nhân",
          "Settings": "Cài đặt",
          "About": "Giới thiệu",
          "Groups": "Nhóm",
          "Other Utilities": "Tiện ích khác",
          "Setting": "Thiết lập",
          "Change password": "Đổi mật khẩu",
          "Languages": "Ngôn ngữ",
          "Personal information": "Thông tin cá nhân",
          "Name": "Tên hiển thị",
          "Birthday": "Ngày sinh",
          "Gender": "Giới tính",
          "Contact information": "Thông tin liên hệ",
          "Phone number": "Số điện thoại",
          "Address": "Địa chỉ",
          "Other": "Khác",
          "Female": "Nữ",
          "Male": "Nam",
          "Edit": "Chỉnh sửa",
          "Email": "Thư điện tử",
          "Linked Account": "Liên kết tài khoản",
          "Help": "Hướng dẫn sử dụng",
          "Sign out": "Đăng xuất",
          "Filer": 'Lọc',
          "Done": "Xong",
          'Enter Course Handicap Conversion': 'Nhập quy đổi Course Handicap',
          "Change language must restart app. Do you want to change language?":
              "Thay đổi ngôn ngữ sẽ phải khởi động lại ứng dụng. Bạn có muốn thay đổi không?",
          "Cancel": "Huỷ",
          "Yes": "Đồng ý",
          "Are you sure to logout of this account?": "Bạn có chăc chắn muốn đăng xuất không?",
          "Wrong User Name or Password": "Sai tài khoản hoặc mật khẩu",
          "Invalid Value": "Trường không hợp lệ",
          "User name or email": "Tên đăng nhập hoặc email",
          "Forgot password": "Quên mật khẩu",
          "Forgot search user name": "Quên tên đăng nhập",
          "Save credential": "Ghi nhớ mật khẩu",
        }
      };
}
