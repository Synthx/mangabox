import 'dart:developer' as developer;

import 'package:logging/logging.dart';

final log = Logger('core');

void onRecord(LogRecord record) {
  developer.log(
    record.message,
    name: record.loggerName,
    level: record.level.value,
    time: record.time,
    error: record.error,
    stackTrace: record.stackTrace,
  );
}
