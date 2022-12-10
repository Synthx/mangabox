import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String locale({
    required DateFormat format,
  }) {
    return format.format(this);
  }
}
