import 'package:intl/intl.dart';

class NeovoDateTime {
  final String date;
  final String hour;
  final String minute;
  final String month;
  final String second;
  final String weekday;
  final String year;

  NeovoDateTime(DateTime dateTime, bool is24HourFormat)
      : date = DateFormat('d').format(dateTime),
        hour = DateFormat(is24HourFormat ? 'HH' : 'hh').format(dateTime),
        minute = DateFormat('mm').format(dateTime),
        month = DateFormat('MMM').format(dateTime),
        second = DateFormat('ss').format(dateTime),
        weekday = DateFormat('EEEE').format(dateTime),
        year = DateFormat('yyyy').format(dateTime);

  double get hr => ((double.parse(hour) % 12) / 12) + (min / 60);
  double get min => (double.parse(minute) / 60) + (sec / 60);
  double get sec => double.parse(second) / 60;
}
