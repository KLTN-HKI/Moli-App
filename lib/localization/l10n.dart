// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLanguage {
  AppLanguage();

  static AppLanguage? _current;

  static AppLanguage get current {
    assert(_current != null,
        'No instance of AppLanguage was loaded. Try to initialize the AppLanguage delegate before accessing AppLanguage.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLanguage> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLanguage();
      AppLanguage._current = instance;

      return instance;
    });
  }

  static AppLanguage of(BuildContext context) {
    final instance = AppLanguage.maybeOf(context);
    assert(instance != null,
        'No instance of AppLanguage present in the widget tree. Did you add AppLanguage.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLanguage? maybeOf(BuildContext context) {
    return Localizations.of<AppLanguage>(context, AppLanguage);
  }

  /// `Bỏ qua`
  String get aborted {
    return Intl.message(
      'Bỏ qua',
      name: 'aborted',
      desc: '',
      args: [],
    );
  }

  /// `Về bác sĩ này`
  String get about_this_doctor {
    return Intl.message(
      'Về bác sĩ này',
      name: 'about_this_doctor',
      desc: '',
      args: [],
    );
  }

  /// `Chấp nhận`
  String get accept {
    return Intl.message(
      'Chấp nhận',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản`
  String get account {
    return Intl.message(
      'Tài khoản',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin tài khoản`
  String get account_info {
    return Intl.message(
      'Thông tin tài khoản',
      name: 'account_info',
      desc: '',
      args: [],
    );
  }

  /// `Thêm`
  String get add {
    return Intl.message(
      'Thêm',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Thêm voucher`
  String get add_voucher {
    return Intl.message(
      'Thêm voucher',
      name: 'add_voucher',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ`
  String get address {
    return Intl.message(
      'Địa chỉ',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Chiều`
  String get afternoon {
    return Intl.message(
      'Chiều',
      name: 'afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Tuổi`
  String get age {
    return Intl.message(
      'Tuổi',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Tất cả`
  String get all {
    return Intl.message(
      'Tất cả',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Phiên bản ứng dụng`
  String get app_version {
    return Intl.message(
      'Phiên bản ứng dụng',
      name: 'app_version',
      desc: '',
      args: [],
    );
  }

  /// `Áp dụng`
  String get apply {
    return Intl.message(
      'Áp dụng',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Lịch hẹn`
  String get appointment {
    return Intl.message(
      'Lịch hẹn',
      name: 'appointment',
      desc: '',
      args: [],
    );
  }

  /// `Tháng 4`
  String get april {
    return Intl.message(
      'Tháng 4',
      name: 'april',
      desc: '',
      args: [],
    );
  }

  /// `Apr`
  String get april_s {
    return Intl.message(
      'Apr',
      name: 'april_s',
      desc: '',
      args: [],
    );
  }

  /// `Tháng 8`
  String get august {
    return Intl.message(
      'Tháng 8',
      name: 'august',
      desc: '',
      args: [],
    );
  }

  /// `Aug`
  String get august_s {
    return Intl.message(
      'Aug',
      name: 'august_s',
      desc: '',
      args: [],
    );
  }

  /// `Có thể chọn`
  String get available_slot {
    return Intl.message(
      'Có thể chọn',
      name: 'available_slot',
      desc: '',
      args: [],
    );
  }

  /// `Lịch rảnh`
  String get available_time {
    return Intl.message(
      'Lịch rảnh',
      name: 'available_time',
      desc: '',
      args: [],
    );
  }

  /// `Quay lại`
  String get back {
    return Intl.message(
      'Quay lại',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Về trang chủ`
  String get back_to_home {
    return Intl.message(
      'Về trang chủ',
      name: 'back_to_home',
      desc: '',
      args: [],
    );
  }

  /// `Bắt đầu`
  String get begin {
    return Intl.message(
      'Bắt đầu',
      name: 'begin',
      desc: '',
      args: [],
    );
  }

  /// `Ngày sinh`
  String get birthday {
    return Intl.message(
      'Ngày sinh',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `Chọn lịch`
  String get book_schedule {
    return Intl.message(
      'Chọn lịch',
      name: 'book_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Không mở được`
  String get can_not_open {
    return Intl.message(
      'Không mở được',
      name: 'can_not_open',
      desc: '',
      args: [],
    );
  }

  /// `Huỷ`
  String get cancel {
    return Intl.message(
      'Huỷ',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Hủy yêu cầu`
  String get cancel_request {
    return Intl.message(
      'Hủy yêu cầu',
      name: 'cancel_request',
      desc: '',
      args: [],
    );
  }

  /// `Huỷ lịch`
  String get cancel_schedule {
    return Intl.message(
      'Huỷ lịch',
      name: 'cancel_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Bỏ chọn`
  String get cancel_selected {
    return Intl.message(
      'Bỏ chọn',
      name: 'cancel_selected',
      desc: '',
      args: [],
    );
  }

  /// `Đã huỷ`
  String get cancelled {
    return Intl.message(
      'Đã huỷ',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `bằng cấp`
  String get certificate {
    return Intl.message(
      'bằng cấp',
      name: 'certificate',
      desc: '',
      args: [],
    );
  }

  /// `Đổi lịch`
  String get change_calendar {
    return Intl.message(
      'Đổi lịch',
      name: 'change_calendar',
      desc: '',
      args: [],
    );
  }

  /// `Đổi mật khẩu`
  String get change_password {
    return Intl.message(
      'Đổi mật khẩu',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi mật khẩu thành công`
  String get change_password_successfully {
    return Intl.message(
      'Thay đổi mật khẩu thành công',
      name: 'change_password_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Trẻ em`
  String get child {
    return Intl.message(
      'Trẻ em',
      name: 'child',
      desc: '',
      args: [],
    );
  }

  /// `Xin hãy chọn ngày khác`
  String get choose_another_date {
    return Intl.message(
      'Xin hãy chọn ngày khác',
      name: 'choose_another_date',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ngày`
  String get choose_date {
    return Intl.message(
      'Chọn ngày',
      name: 'choose_date',
      desc: '',
      args: [],
    );
  }

  /// `Chọn bác sĩ`
  String get choose_doctor {
    return Intl.message(
      'Chọn bác sĩ',
      name: 'choose_doctor',
      desc: '',
      args: [],
    );
  }

  /// `Chọn lĩnh vực`
  String get choose_field_of_work {
    return Intl.message(
      'Chọn lĩnh vực',
      name: 'choose_field_of_work',
      desc: '',
      args: [],
    );
  }

  /// `Hãy chọn giới tính`
  String get choose_gender {
    return Intl.message(
      'Hãy chọn giới tính',
      name: 'choose_gender',
      desc: '',
      args: [],
    );
  }

  /// `Chon quốc tịch`
  String get choose_nationality {
    return Intl.message(
      'Chon quốc tịch',
      name: 'choose_nationality',
      desc: '',
      args: [],
    );
  }

  /// `Chọn thời gian`
  String get choose_time {
    return Intl.message(
      'Chọn thời gian',
      name: 'choose_time',
      desc: '',
      args: [],
    );
  }

  /// `Chọn người dùng`
  String get choose_user {
    return Intl.message(
      'Chọn người dùng',
      name: 'choose_user',
      desc: '',
      args: [],
    );
  }

  /// `Đóng`
  String get close {
    return Intl.message(
      'Đóng',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Đã đóng`
  String get closed {
    return Intl.message(
      'Đã đóng',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Đang đóng`
  String get closing {
    return Intl.message(
      'Đang đóng',
      name: 'closing',
      desc: '',
      args: [],
    );
  }

  /// `Hoàn thành`
  String get complete {
    return Intl.message(
      'Hoàn thành',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Đã hoàn thành`
  String get completed {
    return Intl.message(
      'Đã hoàn thành',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận`
  String get confirm {
    return Intl.message(
      'Xác nhận',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận thông tin`
  String get confirm_information {
    return Intl.message(
      'Xác nhận thông tin',
      name: 'confirm_information',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu`
  String get confirm_password {
    return Intl.message(
      'Nhập lại mật khẩu',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận buổi học`
  String get confirm_session {
    return Intl.message(
      'Xác nhận buổi học',
      name: 'confirm_session',
      desc: '',
      args: [],
    );
  }

  /// `Áp dụng voucher`
  String get confirm_voucher {
    return Intl.message(
      'Áp dụng voucher',
      name: 'confirm_voucher',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận yêu cầu`
  String get confirm_your_request {
    return Intl.message(
      'Xác nhận yêu cầu',
      name: 'confirm_your_request',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi kết nối`
  String get connection_error {
    return Intl.message(
      'Lỗi kết nối',
      name: 'connection_error',
      desc: '',
      args: [],
    );
  }

  /// `Không có kết nối mạng`
  String get connection_lost {
    return Intl.message(
      'Không có kết nối mạng',
      name: 'connection_lost',
      desc: '',
      args: [],
    );
  }

  /// `Liên hệ Moli`
  String get contact_moli {
    return Intl.message(
      'Liên hệ Moli',
      name: 'contact_moli',
      desc: '',
      args: [],
    );
  }

  /// `Tạo tài khoản`
  String get create_an_account {
    return Intl.message(
      'Tạo tài khoản',
      name: 'create_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Tạo hồ sơ`
  String get create_profile {
    return Intl.message(
      'Tạo hồ sơ',
      name: 'create_profile',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu hiện tại`
  String get current_password {
    return Intl.message(
      'Mật khẩu hiện tại',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu hiện tại không đúng`
  String get current_password_wrong {
    return Intl.message(
      'Mật khẩu hiện tại không đúng',
      name: 'current_password_wrong',
      desc: '',
      args: [],
    );
  }

  /// `ngày`
  String get day {
    return Intl.message(
      'ngày',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Ngày bắt đầu`
  String get day_started {
    return Intl.message(
      'Ngày bắt đầu',
      name: 'day_started',
      desc: '',
      args: [],
    );
  }

  /// `ngày`
  String get days {
    return Intl.message(
      'ngày',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `{days} ngày trước`
  String days_relative(Object days) {
    return Intl.message(
      '$days ngày trước',
      name: 'days_relative',
      desc: '',
      args: [days],
    );
  }

  /// `Tháng 12`
  String get december {
    return Intl.message(
      'Tháng 12',
      name: 'december',
      desc: '',
      args: [],
    );
  }

  /// `Dec`
  String get december_s {
    return Intl.message(
      'Dec',
      name: 'december_s',
      desc: '',
      args: [],
    );
  }

  /// `Tạm hoãn`
  String get delay {
    return Intl.message(
      'Tạm hoãn',
      name: 'delay',
      desc: '',
      args: [],
    );
  }

  /// `Xóa`
  String get delete {
    return Intl.message(
      'Xóa',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `{selectedItem} đã xoá sẽ không thể khôi phục bạn có chắc muốn xoá?`
  String delete_warning(Object selectedItem) {
    return Intl.message(
      '$selectedItem đã xoá sẽ không thể khôi phục bạn có chắc muốn xoá?',
      name: 'delete_warning',
      desc: '',
      args: [selectedItem],
    );
  }

  /// `Chi tiết`
  String get detail {
    return Intl.message(
      'Chi tiết',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết lý do`
  String get detail_reason {
    return Intl.message(
      'Chi tiết lý do',
      name: 'detail_reason',
      desc: '',
      args: [],
    );
  }

  /// `Bỏ qua`
  String get dismiss {
    return Intl.message(
      'Bỏ qua',
      name: 'dismiss',
      desc: '',
      args: [],
    );
  }

  /// `Không có`
  String get do_not_have {
    return Intl.message(
      'Không có',
      name: 'do_not_have',
      desc: '',
      args: [],
    );
  }

  /// `Bác sĩ`
  String get doctor {
    return Intl.message(
      'Bác sĩ',
      name: 'doctor',
      desc: '',
      args: [],
    );
  }

  /// `Xong`
  String get done {
    return Intl.message(
      'Xong',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Không có tài khoản?`
  String get dont_have_an_account {
    return Intl.message(
      'Không có tài khoản?',
      name: 'dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Email hoặc số điện thoại`
  String get email_or_phone_number {
    return Intl.message(
      'Email hoặc số điện thoại',
      name: 'email_or_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Ở đây hơi trống vắng`
  String get empty_title {
    return Intl.message(
      'Ở đây hơi trống vắng',
      name: 'empty_title',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã OTP đã gửi qua SMS của bạn`
  String get enter_otp_sent_via_your_sms {
    return Intl.message(
      'Nhập mã OTP đã gửi qua SMS của bạn',
      name: 'enter_otp_sent_via_your_sms',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mã OTP đã gửi qua SMS của bạn`
  String get enter_sent_otp {
    return Intl.message(
      'Nhập mã OTP đã gửi qua SMS của bạn',
      name: 'enter_sent_otp',
      desc: '',
      args: [],
    );
  }

  /// `Nhập {content}`
  String enter_value(Object content) {
    return Intl.message(
      'Nhập $content',
      name: 'enter_value',
      desc: '',
      args: [content],
    );
  }

  /// `Nhập mật khẩu mới`
  String get enter_your_new_password {
    return Intl.message(
      'Nhập mật khẩu mới',
      name: 'enter_your_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi`
  String get error {
    return Intl.message(
      'Lỗi',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Có lỗi xảy ra, chúng tôi đang khắc phục`
  String get error_fixing {
    return Intl.message(
      'Có lỗi xảy ra, chúng tôi đang khắc phục',
      name: 'error_fixing',
      desc: '',
      args: [],
    );
  }

  /// `Tối`
  String get evening {
    return Intl.message(
      'Tối',
      name: 'evening',
      desc: '',
      args: [],
    );
  }

  /// `Khám phá`
  String get explore_page {
    return Intl.message(
      'Khám phá',
      name: 'explore_page',
      desc: '',
      args: [],
    );
  }

  /// `Tháng 2`
  String get february {
    return Intl.message(
      'Tháng 2',
      name: 'february',
      desc: '',
      args: [],
    );
  }

  /// `Feb`
  String get february_s {
    return Intl.message(
      'Feb',
      name: 'february_s',
      desc: '',
      args: [],
    );
  }

  /// `Nữ`
  String get female {
    return Intl.message(
      'Nữ',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Vài giây trước`
  String get few_seconds_ago {
    return Intl.message(
      'Vài giây trước',
      name: 'few_seconds_ago',
      desc: '',
      args: [],
    );
  }

  /// `Lĩnh vực làm việc`
  String get field_of_work {
    return Intl.message(
      'Lĩnh vực làm việc',
      name: 'field_of_work',
      desc: '',
      args: [],
    );
  }

  /// `Dành cho`
  String get for_someone {
    return Intl.message(
      'Dành cho',
      name: 'for_someone',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu?`
  String get forgot_password {
    return Intl.message(
      'Quên mật khẩu?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Miễn phí`
  String get free {
    return Intl.message(
      'Miễn phí',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Thứ sáu`
  String get friday {
    return Intl.message(
      'Thứ sáu',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `T6`
  String get friday_s {
    return Intl.message(
      'T6',
      name: 'friday_s',
      desc: '',
      args: [],
    );
  }

  /// `Giới thiệu bạn bè`
  String get friend_referral {
    return Intl.message(
      'Giới thiệu bạn bè',
      name: 'friend_referral',
      desc: '',
      args: [],
    );
  }

  /// `Đầy đủ`
  String get full {
    return Intl.message(
      'Đầy đủ',
      name: 'full',
      desc: '',
      args: [],
    );
  }

  /// `Họ và tên`
  String get full_name {
    return Intl.message(
      'Họ và tên',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Giới tính`
  String get gender {
    return Intl.message(
      'Giới tính',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Nhận ngay`
  String get get_now {
    return Intl.message(
      'Nhận ngay',
      name: 'get_now',
      desc: '',
      args: [],
    );
  }

  /// `Đang diễn ra`
  String get happening {
    return Intl.message(
      'Đang diễn ra',
      name: 'happening',
      desc: '',
      args: [],
    );
  }

  /// `Xin chào {name}`
  String hello_someone(Object name) {
    return Intl.message(
      'Xin chào $name',
      name: 'hello_someone',
      desc: '',
      args: [name],
    );
  }

  /// `Xin chào {person}`
  String hello_to(Object person) {
    return Intl.message(
      'Xin chào $person',
      name: 'hello_to',
      desc: '',
      args: [person],
    );
  }

  /// `Trung tâm trợ giúp`
  String get help_center {
    return Intl.message(
      'Trung tâm trợ giúp',
      name: 'help_center',
      desc: '',
      args: [],
    );
  }

  /// `Ẩn`
  String get hide {
    return Intl.message(
      'Ẩn',
      name: 'hide',
      desc: '',
      args: [],
    );
  }

  /// `Lịch sử`
  String get history {
    return Intl.message(
      'Lịch sử',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Trang chủ`
  String get home {
    return Intl.message(
      'Trang chủ',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `giờ`
  String get hour {
    return Intl.message(
      'giờ',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `giờ`
  String get hours {
    return Intl.message(
      'giờ',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `{hours} giờ trước`
  String hours_relative(Object hours) {
    return Intl.message(
      '$hours giờ trước',
      name: 'hours_relative',
      desc: '',
      args: [hours],
    );
  }

  /// `Tôi hiểu rồi`
  String get i_got_it {
    return Intl.message(
      'Tôi hiểu rồi',
      name: 'i_got_it',
      desc: '',
      args: [],
    );
  }

  /// `Tính năng đang được xây dựng`
  String get implementing_feature {
    return Intl.message(
      'Tính năng đang được xây dựng',
      name: 'implementing_feature',
      desc: '',
      args: [],
    );
  }

  /// `Chúng tôi đang xây dựng tính năng này`
  String get implementing_feature_detail {
    return Intl.message(
      'Chúng tôi đang xây dựng tính năng này',
      name: 'implementing_feature_detail',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin`
  String get infomation {
    return Intl.message(
      'Thông tin',
      name: 'infomation',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin & Hỗ trợ`
  String get information_support {
    return Intl.message(
      'Thông tin & Hỗ trợ',
      name: 'information_support',
      desc: '',
      args: [],
    );
  }

  /// `Mất kết nối internet`
  String get internet_connection_lost {
    return Intl.message(
      'Mất kết nối internet',
      name: 'internet_connection_lost',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi định dạng hoặc giá trị không đúng`
  String get invalid_format_or_value_error {
    return Intl.message(
      'Lỗi định dạng hoặc giá trị không đúng',
      name: 'invalid_format_or_value_error',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại không hợp lệ`
  String get invalid_phone_number {
    return Intl.message(
      'Số điện thoại không hợp lệ',
      name: 'invalid_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Tháng 1`
  String get january {
    return Intl.message(
      'Tháng 1',
      name: 'january',
      desc: '',
      args: [],
    );
  }

  /// `Jan`
  String get january_s {
    return Intl.message(
      'Jan',
      name: 'january_s',
      desc: '',
      args: [],
    );
  }

  /// `Tham gia`
  String get join {
    return Intl.message(
      'Tham gia',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Tháng 7`
  String get july {
    return Intl.message(
      'Tháng 7',
      name: 'july',
      desc: '',
      args: [],
    );
  }

  /// `Jul`
  String get july_s {
    return Intl.message(
      'Jul',
      name: 'july_s',
      desc: '',
      args: [],
    );
  }

  /// `Tháng 6`
  String get june {
    return Intl.message(
      'Tháng 6',
      name: 'june',
      desc: '',
      args: [],
    );
  }

  /// `Jun`
  String get june_s {
    return Intl.message(
      'Jun',
      name: 'june_s',
      desc: '',
      args: [],
    );
  }

  /// `Ngôn ngữ`
  String get langauge {
    return Intl.message(
      'Ngôn ngữ',
      name: 'langauge',
      desc: '',
      args: [],
    );
  }

  /// `Khuya`
  String get late_night {
    return Intl.message(
      'Khuya',
      name: 'late_night',
      desc: '',
      args: [],
    );
  }

  /// `Để sau`
  String get later {
    return Intl.message(
      'Để sau',
      name: 'later',
      desc: '',
      args: [],
    );
  }

  /// `Bắt đầu`
  String get let_go {
    return Intl.message(
      'Bắt đầu',
      name: 'let_go',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get log_in {
    return Intl.message(
      'Đăng nhập',
      name: 'log_in',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất`
  String get log_out {
    return Intl.message(
      'Đăng xuất',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có muốn đăng xuất khỏi thiết bị này?`
  String get log_out_confirmation {
    return Intl.message(
      'Bạn có muốn đăng xuất khỏi thiết bị này?',
      name: 'log_out_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập thất bại`
  String get login_failed {
    return Intl.message(
      'Đăng nhập thất bại',
      name: 'login_failed',
      desc: '',
      args: [],
    );
  }

  /// `Sai tên đăng nhập hoặc mật khẩu`
  String get login_failed_incorrect_authentication {
    return Intl.message(
      'Sai tên đăng nhập hoặc mật khẩu',
      name: 'login_failed_incorrect_authentication',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập để tiếp tục`
  String get login_to_continue {
    return Intl.message(
      'Đăng nhập để tiếp tục',
      name: 'login_to_continue',
      desc: '',
      args: [],
    );
  }

  /// `Nam`
  String get male {
    return Intl.message(
      'Nam',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Tháng 3`
  String get march {
    return Intl.message(
      'Tháng 3',
      name: 'march',
      desc: '',
      args: [],
    );
  }

  /// `Mar`
  String get march_s {
    return Intl.message(
      'Mar',
      name: 'march_s',
      desc: '',
      args: [],
    );
  }

  /// `Tháng 5`
  String get may {
    return Intl.message(
      'Tháng 5',
      name: 'may',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get may_s {
    return Intl.message(
      'May',
      name: 'may_s',
      desc: '',
      args: [],
    );
  }

  /// `Lịch khám`
  String get medical_appointment {
    return Intl.message(
      'Lịch khám',
      name: 'medical_appointment',
      desc: '',
      args: [],
    );
  }

  /// `Tin nhắn`
  String get message {
    return Intl.message(
      'Tin nhắn',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Nhắn tin CSKH`
  String get message_customer_care {
    return Intl.message(
      'Nhắn tin CSKH',
      name: 'message_customer_care',
      desc: '',
      args: [],
    );
  }

  /// `phút`
  String get minute {
    return Intl.message(
      'phút',
      name: 'minute',
      desc: '',
      args: [],
    );
  }

  /// `phút`
  String get minutes {
    return Intl.message(
      'phút',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `{minutes} phút trước`
  String minutes_relative(Object minutes) {
    return Intl.message(
      '$minutes phút trước',
      name: 'minutes_relative',
      desc: '',
      args: [minutes],
    );
  }

  /// `Moli`
  String get moli {
    return Intl.message(
      'Moli',
      name: 'moli',
      desc: '',
      args: [],
    );
  }

  /// `Thứ hai`
  String get monday {
    return Intl.message(
      'Thứ hai',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `T2`
  String get monday_s {
    return Intl.message(
      'T2',
      name: 'monday_s',
      desc: '',
      args: [],
    );
  }

  /// `tháng`
  String get month {
    return Intl.message(
      'tháng',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `tháng`
  String get months {
    return Intl.message(
      'tháng',
      name: 'months',
      desc: '',
      args: [],
    );
  }

  /// `Thêm`
  String get more {
    return Intl.message(
      'Thêm',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Sáng`
  String get morning {
    return Intl.message(
      'Sáng',
      name: 'morning',
      desc: '',
      args: [],
    );
  }

  /// `Hồ sơ của tôi`
  String get my_profile {
    return Intl.message(
      'Hồ sơ của tôi',
      name: 'my_profile',
      desc: '',
      args: [],
    );
  }

  /// `Quốc tịch`
  String get nationality {
    return Intl.message(
      'Quốc tịch',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu mới`
  String get new_password {
    return Intl.message(
      'Mật khẩu mới',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp tục`
  String get next {
    return Intl.message(
      'Tiếp tục',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Buổi học tiếp theo`
  String get next_sessionV2 {
    return Intl.message(
      'Buổi học tiếp theo',
      name: 'next_sessionV2',
      desc: '',
      args: [],
    );
  }

  /// `Tối`
  String get night {
    return Intl.message(
      'Tối',
      name: 'night',
      desc: '',
      args: [],
    );
  }

  /// `Không`
  String get no {
    return Intl.message(
      'Không',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Không có kết nối internet`
  String get no_internet_connectivity {
    return Intl.message(
      'Không có kết nối internet',
      name: 'no_internet_connectivity',
      desc: '',
      args: [],
    );
  }

  /// `Không có thông báo`
  String get no_notification {
    return Intl.message(
      'Không có thông báo',
      name: 'no_notification',
      desc: '',
      args: [],
    );
  }

  /// `Không diễn ra`
  String get not_happened {
    return Intl.message(
      'Không diễn ra',
      name: 'not_happened',
      desc: '',
      args: [],
    );
  }

  /// `Ghi chú cho bệnh nhân`
  String get note_for_patient {
    return Intl.message(
      'Ghi chú cho bệnh nhân',
      name: 'note_for_patient',
      desc: '',
      args: [],
    );
  }

  /// `Ghi chú`
  String get notes {
    return Intl.message(
      'Ghi chú',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo`
  String get notification {
    return Intl.message(
      'Thông báo',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết thông báo`
  String get notification_detail {
    return Intl.message(
      'Chi tiết thông báo',
      name: 'notification_detail',
      desc: '',
      args: [],
    );
  }

  /// `Tháng 11`
  String get november {
    return Intl.message(
      'Tháng 11',
      name: 'november',
      desc: '',
      args: [],
    );
  }

  /// `Nov`
  String get november_s {
    return Intl.message(
      'Nov',
      name: 'november_s',
      desc: '',
      args: [],
    );
  }

  /// `Bây giờ`
  String get now {
    return Intl.message(
      'Bây giờ',
      name: 'now',
      desc: '',
      args: [],
    );
  }

  /// `Tháng 10`
  String get october {
    return Intl.message(
      'Tháng 10',
      name: 'october',
      desc: '',
      args: [],
    );
  }

  /// `Oct`
  String get october_s {
    return Intl.message(
      'Oct',
      name: 'october_s',
      desc: '',
      args: [],
    );
  }

  /// `Đồng ý`
  String get ok {
    return Intl.message(
      'Đồng ý',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu cũ`
  String get old_password {
    return Intl.message(
      'Mật khẩu cũ',
      name: 'old_password',
      desc: '',
      args: [],
    );
  }

  /// `Hoạt động`
  String get open {
    return Intl.message(
      'Hoạt động',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Tuỳ chọn`
  String get optional {
    return Intl.message(
      'Tuỳ chọn',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `hoặc`
  String get or {
    return Intl.message(
      'hoặc',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Khác`
  String get other {
    return Intl.message(
      'Khác',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi khác`
  String get other_error {
    return Intl.message(
      'Lỗi khác',
      name: 'other_error',
      desc: '',
      args: [],
    );
  }

  /// `Lý do khác`
  String get other_reason {
    return Intl.message(
      'Lý do khác',
      name: 'other_reason',
      desc: '',
      args: [],
    );
  }

  /// `Tổng quan`
  String get overview {
    return Intl.message(
      'Tổng quan',
      name: 'overview',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get password {
    return Intl.message(
      'Mật khẩu',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu & Bảo mật`
  String get password_security {
    return Intl.message(
      'Mật khẩu & Bảo mật',
      name: 'password_security',
      desc: '',
      args: [],
    );
  }

  /// `Trì hoãn`
  String get pending {
    return Intl.message(
      'Trì hoãn',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin cá nhân`
  String get personal_infomation {
    return Intl.message(
      'Thông tin cá nhân',
      name: 'personal_infomation',
      desc: '',
      args: [],
    );
  }

  /// `Nhu cầu cá nhân`
  String get personal_preference {
    return Intl.message(
      'Nhu cầu cá nhân',
      name: 'personal_preference',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get phone_number {
    return Intl.message(
      'Số điện thoại',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `chọn`
  String get pick {
    return Intl.message(
      'chọn',
      name: 'pick',
      desc: '',
      args: [],
    );
  }

  /// `Đã chọn`
  String get picked {
    return Intl.message(
      'Đã chọn',
      name: 'picked',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập {content}`
  String please_enter(Object content) {
    return Intl.message(
      'Vui lòng nhập $content',
      name: 'please_enter',
      desc: '',
      args: [content],
    );
  }

  /// `Vui lòng nhập số điện thoại đã đăng ký`
  String get please_enter_signed_phone_number {
    return Intl.message(
      'Vui lòng nhập số điện thoại đã đăng ký',
      name: 'please_enter_signed_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Chính sách`
  String get policy {
    return Intl.message(
      'Chính sách',
      name: 'policy',
      desc: '',
      args: [],
    );
  }

  /// `Bây giờ`
  String get present {
    return Intl.message(
      'Bây giờ',
      name: 'present',
      desc: '',
      args: [],
    );
  }

  /// `Hồ sơ`
  String get profile {
    return Intl.message(
      'Hồ sơ',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Ưu đãi đổi quà`
  String get promo_gift {
    return Intl.message(
      'Ưu đãi đổi quà',
      name: 'promo_gift',
      desc: '',
      args: [],
    );
  }

  /// `Tham gia ngay`
  String get quick_join {
    return Intl.message(
      'Tham gia ngay',
      name: 'quick_join',
      desc: '',
      args: [],
    );
  }

  /// `Lý do`
  String get reason {
    return Intl.message(
      'Lý do',
      name: 'reason',
      desc: '',
      args: [],
    );
  }

  /// `Nhận`
  String get receive {
    return Intl.message(
      'Nhận',
      name: 'receive',
      desc: '',
      args: [],
    );
  }

  /// `Mã giới thiệu`
  String get referral {
    return Intl.message(
      'Mã giới thiệu',
      name: 'referral',
      desc: '',
      args: [],
    );
  }

  /// `Vùng miền`
  String get regions {
    return Intl.message(
      'Vùng miền',
      name: 'regions',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký`
  String get register {
    return Intl.message(
      'Đăng ký',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `thời lượng đăng ký`
  String get register_duration {
    return Intl.message(
      'thời lượng đăng ký',
      name: 'register_duration',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký khoá mới`
  String get register_new_course {
    return Intl.message(
      'Đăng ký khoá mới',
      name: 'register_new_course',
      desc: '',
      args: [],
    );
  }

  /// `Từ chối`
  String get reject {
    return Intl.message(
      'Từ chối',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Đã`
  String get rejected {
    return Intl.message(
      'Đã',
      name: 'rejected',
      desc: '',
      args: [],
    );
  }

  /// `Bỏ đã chọn`
  String get remove_seleted {
    return Intl.message(
      'Bỏ đã chọn',
      name: 'remove_seleted',
      desc: '',
      args: [],
    );
  }

  /// `Yêu cầu`
  String get request {
    return Intl.message(
      'Yêu cầu',
      name: 'request',
      desc: '',
      args: [],
    );
  }

  /// `Yêu cầu bị hủy sớm`
  String get request_cancelled_prematurely {
    return Intl.message(
      'Yêu cầu bị hủy sớm',
      name: 'request_cancelled_prematurely',
      desc: '',
      args: [],
    );
  }

  /// `Yêu cầu bị thất bại, vui lòng thử lại sau ít phút`
  String get request_failed {
    return Intl.message(
      'Yêu cầu bị thất bại, vui lòng thử lại sau ít phút',
      name: 'request_failed',
      desc: '',
      args: [],
    );
  }

  /// `Không bỏ trống`
  String get required {
    return Intl.message(
      'Không bỏ trống',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin này không được để trống`
  String get required_field {
    return Intl.message(
      'Thông tin này không được để trống',
      name: 'required_field',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại mã sau `
  String get resend_otp_after {
    return Intl.message(
      'Gửi lại mã sau ',
      name: 'resend_otp_after',
      desc: '',
      args: [],
    );
  }

  /// `Kết quả`
  String get result {
    return Intl.message(
      'Kết quả',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `Lộ trình`
  String get roadmap {
    return Intl.message(
      'Lộ trình',
      name: 'roadmap',
      desc: '',
      args: [],
    );
  }

  /// `Thứ bảy`
  String get saturday {
    return Intl.message(
      'Thứ bảy',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `T7`
  String get saturday_s {
    return Intl.message(
      'T7',
      name: 'saturday_s',
      desc: '',
      args: [],
    );
  }

  /// `Lưu`
  String get save {
    return Intl.message(
      'Lưu',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Lịch`
  String get schedule {
    return Intl.message(
      'Lịch',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Điểm`
  String get score {
    return Intl.message(
      'Điểm',
      name: 'score',
      desc: '',
      args: [],
    );
  }

  /// `Tìm kiếm`
  String get search {
    return Intl.message(
      'Tìm kiếm',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Bảo mật`
  String get security {
    return Intl.message(
      'Bảo mật',
      name: 'security',
      desc: '',
      args: [],
    );
  }

  /// `Xem thêm`
  String get see_more {
    return Intl.message(
      'Xem thêm',
      name: 'see_more',
      desc: '',
      args: [],
    );
  }

  /// `Chọn tất cả`
  String get select_all {
    return Intl.message(
      'Chọn tất cả',
      name: 'select_all',
      desc: '',
      args: [],
    );
  }

  /// `Đã chọn`
  String get selected {
    return Intl.message(
      'Đã chọn',
      name: 'selected',
      desc: '',
      args: [],
    );
  }

  /// `Gửi phản hồi`
  String get send_feedback {
    return Intl.message(
      'Gửi phản hồi',
      name: 'send_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Gửi thông báo`
  String get send_notify {
    return Intl.message(
      'Gửi thông báo',
      name: 'send_notify',
      desc: '',
      args: [],
    );
  }

  /// `Tháng 9`
  String get september {
    return Intl.message(
      'Tháng 9',
      name: 'september',
      desc: '',
      args: [],
    );
  }

  /// `Sep`
  String get september_s {
    return Intl.message(
      'Sep',
      name: 'september_s',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi máy chủ`
  String get serrver_error {
    return Intl.message(
      'Lỗi máy chủ',
      name: 'serrver_error',
      desc: '',
      args: [],
    );
  }

  /// `Phản hồi dịch vụ`
  String get service_feedback {
    return Intl.message(
      'Phản hồi dịch vụ',
      name: 'service_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Hiển thị`
  String get show {
    return Intl.message(
      'Hiển thị',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get sign_in {
    return Intl.message(
      'Đăng nhập',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất`
  String get sign_out {
    return Intl.message(
      'Đăng xuất',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký`
  String get sign_up {
    return Intl.message(
      'Đăng ký',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Sắp xếp bằng`
  String get sort_by {
    return Intl.message(
      'Sắp xếp bằng',
      name: 'sort_by',
      desc: '',
      args: [],
    );
  }

  /// `Chủ Nhật`
  String get sunday {
    return Intl.message(
      'Chủ Nhật',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `CN`
  String get sunday_s {
    return Intl.message(
      'CN',
      name: 'sunday_s',
      desc: '',
      args: [],
    );
  }

  /// `Hỗ trợ`
  String get support {
    return Intl.message(
      'Hỗ trợ',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Điều khoản và quy định`
  String get terms_conditions {
    return Intl.message(
      'Điều khoản và quy định',
      name: 'terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Điều khoản dịch vụ`
  String get terms_of_service {
    return Intl.message(
      'Điều khoản dịch vụ',
      name: 'terms_of_service',
      desc: '',
      args: [],
    );
  }

  /// `Thứ năm`
  String get thursday {
    return Intl.message(
      'Thứ năm',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `T5`
  String get thursday_s {
    return Intl.message(
      'T5',
      name: 'thursday_s',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian`
  String get times {
    return Intl.message(
      'Thời gian',
      name: 'times',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp tục`
  String get to_continue {
    return Intl.message(
      'Tiếp tục',
      name: 'to_continue',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán`
  String get to_pay {
    return Intl.message(
      'Thanh toán',
      name: 'to_pay',
      desc: '',
      args: [],
    );
  }

  /// `Hôm nay`
  String get today {
    return Intl.message(
      'Hôm nay',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Lịch hẹn hôm nay`
  String get today_appointment {
    return Intl.message(
      'Lịch hẹn hôm nay',
      name: 'today_appointment',
      desc: '',
      args: [],
    );
  }

  /// `Phiên của bạn đã hết hạn, vui lòng đăng nhập lại`
  String get token_session_expired {
    return Intl.message(
      'Phiên của bạn đã hết hạn, vui lòng đăng nhập lại',
      name: 'token_session_expired',
      desc: '',
      args: [],
    );
  }

  /// `Ngày mai`
  String get tomorrow {
    return Intl.message(
      'Ngày mai',
      name: 'tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Hãy thử lại sau`
  String get try_again {
    return Intl.message(
      'Hãy thử lại sau',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `Thứ ba`
  String get tuesday {
    return Intl.message(
      'Thứ ba',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `T3`
  String get tuesday_s {
    return Intl.message(
      'T3',
      name: 'tuesday_s',
      desc: '',
      args: [],
    );
  }

  /// `Không xác định`
  String get unknown {
    return Intl.message(
      'Không xác định',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Lỗi không xác định`
  String get unknown_error {
    return Intl.message(
      'Lỗi không xác định',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Sắp diễn ra`
  String get up_coming {
    return Intl.message(
      'Sắp diễn ra',
      name: 'up_coming',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật`
  String get update {
    return Intl.message(
      'Cập nhật',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Đã cập nhật`
  String get updated {
    return Intl.message(
      'Đã cập nhật',
      name: 'updated',
      desc: '',
      args: [],
    );
  }

  /// `Đang cập nhật`
  String get updating {
    return Intl.message(
      'Đang cập nhật',
      name: 'updating',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mã OTP`
  String get verify_otp_code {
    return Intl.message(
      'Xác nhận mã OTP',
      name: 'verify_otp_code',
      desc: '',
      args: [],
    );
  }

  /// `Xem`
  String get view {
    return Intl.message(
      'Xem',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Xem chi tiết`
  String get view_detail {
    return Intl.message(
      'Xem chi tiết',
      name: 'view_detail',
      desc: '',
      args: [],
    );
  }

  /// `Xem lịch sử`
  String get view_history {
    return Intl.message(
      'Xem lịch sử',
      name: 'view_history',
      desc: '',
      args: [],
    );
  }

  /// `Thứ tư`
  String get wednesday {
    return Intl.message(
      'Thứ tư',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `T4`
  String get wednesday_s {
    return Intl.message(
      'T4',
      name: 'wednesday_s',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {person}`
  String welcome_to(String person) {
    return Intl.message(
      'Welcome $person',
      name: 'welcome_to',
      desc: '',
      args: [person],
    );
  }

  /// `năm`
  String get year {
    return Intl.message(
      'năm',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `năm`
  String get years {
    return Intl.message(
      'năm',
      name: 'years',
      desc: '',
      args: [],
    );
  }

  /// `Có`
  String get yes {
    return Intl.message(
      'Có',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đã học được`
  String get you_have_learnt {
    return Intl.message(
      'Bạn đã học được',
      name: 'you_have_learnt',
      desc: '',
      args: [],
    );
  }

  /// `Bạn không có khoá học nào`
  String get you_have_no_course {
    return Intl.message(
      'Bạn không có khoá học nào',
      name: 'you_have_no_course',
      desc: '',
      args: [],
    );
  }

  /// `Nhập ghi chú của bạn`
  String get you_to_take_notes {
    return Intl.message(
      'Nhập ghi chú của bạn',
      name: 'you_to_take_notes',
      desc: '',
      args: [],
    );
  }

  /// `Phản hồi của bạn`
  String get your_feedback {
    return Intl.message(
      'Phản hồi của bạn',
      name: 'your_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Mục tiêu của bạn`
  String get your_goal {
    return Intl.message(
      'Mục tiêu của bạn',
      name: 'your_goal',
      desc: '',
      args: [],
    );
  }

  /// `Phiên của bạn đã hết hạn`
  String get your_session_has_expired {
    return Intl.message(
      'Phiên của bạn đã hết hạn',
      name: 'your_session_has_expired',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLanguage> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLanguage> load(Locale locale) => AppLanguage.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
