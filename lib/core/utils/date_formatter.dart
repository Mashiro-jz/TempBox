// lib\core\utils\date_formatter.dart
import 'package:intl/intl.dart';

class DateFormatter {
  DateTime date;
  final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  DateFormatter(this.date);

  String formattedDate(DateTime date) {
    return formatter.format(date);
  }
}
