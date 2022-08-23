import 'package:intl/intl.dart';

class DateTimeUtils {
  static String? formatTime(DateTime? time, {bool hmOnly = false}) {
    try {
      return hmOnly
          ? DateFormat.Hm().format(time!)
          : DateFormat.Hms().format(time!);
    } catch (e) {
      return null;
    }
  }

  static DateTime? parseTime(String? numberString) {
    try {
      return DateFormat.Hms().parse(numberString!);
    } catch (e) {
      return null;
    }
  }

  static String? formatDateTime(DateTime? time) {
    if (time == null) return null;
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(time);
  }

  static DateTime? parseDateTime(String? timeString) {
    if (timeString == null) return null;
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(timeString);
  }

  static String? formatDateTimeDateOnly(DateTime? time) {
    if (time == null) return null;
    return DateFormat('yyyy-MM-dd').format(time);
  }

  static DateTime? parseDateTimeDateOnly(String? timeString) {
    if (timeString == null) return null;
    return DateFormat('yyyy-MM-dd').parse(timeString);
  }

  static String formatDuration(Duration duration) {
    return (duration.inMinutes / 60).toStringAsFixed(2);
  }

  static Duration parseDuration(String numberString) {
    final number = double.tryParse(numberString)!;
    return Duration(
        hours: number.ceil(), minutes: ((number - number.ceil()) * 60).ceil(),);
  }

  static String getDateTimeNow(String formatDate) {
    return DateFormat(formatDate).format(DateTime.now());
  }

  static double? parseDurationString(String? duration) =>
      double.tryParse(duration ?? '0.0');

  static String? fromTimeToString(DateTime? time) {
    try {
      return DateFormat.Hms().format(time!);
    } catch (e) {
      return null;
    }
  }

  static DateTime? fromStringToTime(String? numberString) {
    try {
      return DateFormat.Hms().parse(numberString!);
    } catch (e) {
      return null;
    }
  }
}
