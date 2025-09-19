// lib\core\utils\date_formatter.dart
import 'package:intl/intl.dart';

class DateFormatter {
  final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');

  String formattedDate(DateTime date) {
    return formatter.format(date);
  }
}
