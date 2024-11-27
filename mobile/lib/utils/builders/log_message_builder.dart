import 'package:logging/logging.dart';

class LogMessageBuilder {
  final List<dynamic> _parts = [];

  LogMessageBuilder addLevel(String level) {
    _parts.add('level: $level');

    return this;
  }

  LogMessageBuilder addName(String name) {
    _parts.add('loggerName: $name');

    return this;
  }

  LogMessageBuilder addTime(DateTime time) {
    _parts.add('time: $time');

    return this;
  }

  LogMessageBuilder addMessage(String message) {
    _parts.add('message: $message');

    return this;
  }

  LogMessageBuilder addError(Object? error) {
    if (error != null) {
      _parts.add('error: $error');
    }

    return this;
  }

  LogMessageBuilder addStackTrace(StackTrace? stackTrace) {
    if (stackTrace != null) {
      _parts.add('stackTrace: $stackTrace');
    }

    return this;
  }

  String build() {
    return _parts.join('\n');
  }
}

class LogMessageManager {
  String buildLogMessage(LogRecord record, {bool skipStackTrace = false}) {
    final logMessageBuilder = LogMessageBuilder();

    final message = logMessageBuilder
        .addLevel(record.level.name)
        .addName(record.loggerName)
        .addTime(record.time)
        .addMessage(record.message)
        .addError(record.error);

    if (skipStackTrace) {
      return message.build();
    }

    return message.addStackTrace(record.stackTrace).build();
  }
}

final logMessageManager = LogMessageManager();
