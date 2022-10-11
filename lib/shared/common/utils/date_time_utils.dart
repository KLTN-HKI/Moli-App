import 'package:intl/intl.dart';
import 'package:moli_app/localization/l10n.dart';

class DateTimeUtils {
  const DateTimeUtils._();
  static String day(int dayWeek) {
    switch (dayWeek) {
      case 1:
        return AppLanguage.current.monday_s;

      case 2:
        return AppLanguage.current.tuesday_s;

      case 3:
        return AppLanguage.current.wednesday_s;

      case 4:
        return AppLanguage.current.thursday_s;

      case 5:
        return AppLanguage.current.friday_s;

      case 6:
        return AppLanguage.current.saturday_s;

      case 7:
        return AppLanguage.current.sunday_s;

      default:
        return AppLanguage.current.monday_s;
    }
  }

  static String weekDay(int dayWeek) {
    switch (dayWeek) {
      case 1:
        return AppLanguage.current.monday;

      case 2:
        return AppLanguage.current.tuesday;

      case 3:
        return AppLanguage.current.wednesday;

      case 4:
        return AppLanguage.current.thursday;

      case 5:
        return AppLanguage.current.friday;

      case 6:
        return AppLanguage.current.saturday;

      case 7:
        return AppLanguage.current.sunday;

      default:
        return AppLanguage.current.monday;
    }
  }

  static String? formatTime(DateTime? time, {bool hmOnly = false}) {
    try {
      return hmOnly
          ? DateFormat.Hm().format(time!)
          : DateFormat.Hms().format(time!);
    } catch (e) {
      return null;
    }
  }

  static DateTime? parseTime(String? numberString, {bool hmOnly = false}) {
    try {
      return hmOnly
          ? DateFormat.Hm().parse(numberString!)
          : DateFormat.Hms().parse(numberString!);
    } catch (e) {
      return null;
    }
  }

  static String? formatDateTime(DateTime? time) {
    if (time == null) {
      return null;
    }
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(time);
  }

  static DateTime? parseDateTime(String? timeString) {
    if (timeString == null) {
      return null;
    }
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(timeString);
  }

  static String? formatDateTimeDateOnly(DateTime? time) {
    if (time == null) {
      return null;
    }
    return DateFormat('dd-MM-yyyy').format(time);
  }

  static DateTime? parseDateTimeDateOnly(String? timeString) {
    if (timeString == null) {
      return null;
    }
    return DateFormat('dd-MM-yyyy').parse(timeString);
  }

  static String formatDuration(Duration duration) {
    return (duration.inMinutes / 60).toStringAsFixed(2);
  }

  static Duration parseDuration(String numberString) {
    final double number = double.tryParse(numberString)!;
    return Duration(
      hours: number.ceil(),
      minutes: ((number - number.ceil()) * 60).ceil(),
    );
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

  static String? fromTimeToStringType2(DateTime? time) {
    try {
      return DateFormat.Hm().format(time!);
    } catch (e) {
      return null;
    }
  }

  static DateTime? fromStringToTimeType2(String? numberString) {
    try {
      return DateFormat.Hm().parse(numberString!);
    } catch (e) {
      return null;
    }
  }

  static String? relative(
    DateTime? dateTime, {
    Duration? formatAfter,
    Duration? timeShowNow,
  }) {
    // After now
    final DateTime now = DateTime.now();
    if (dateTime!.isAfter(now)) {
      return formatDateTime(dateTime);
    }
    // Before formatAfter
    final Duration difference = dateTime.difference(now).abs();
    if (formatAfter != null && difference >= formatAfter) {
      return formatDateTime(dateTime);
    }
    // Less timeShowNow
    if (timeShowNow != null && difference < timeShowNow) {
      return AppLanguage.current.now;
    }
    // Defaut
    if (difference < const Duration(minutes: 1)) {
      return AppLanguage.current.few_seconds_ago;
    } else if (difference < const Duration(hours: 1)) {
      return AppLanguage.current.minutes_relative(difference.inMinutes);
    } else if (difference < const Duration(days: 1)) {
      return AppLanguage.current.hours_relative(difference.inHours);
    } else if (difference < const Duration(days: 30)) {
      return AppLanguage.current.days_relative(difference.inDays);
    } else {
      return formatDateTimeDateOnly(dateTime);
    }
  }
}
