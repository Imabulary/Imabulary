import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';
import 'package:mobile/utils/builders/log_message_builder.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// The app Global logger.
final appLogger = Logger("AppLogger");

/// AppLogging class initializes the logging set up at object creation.
/// To call it is just AppLogging() within the main function block.
///
/// Note, this an obseverable log that operates in all modes including
/// release which means we do not use print but instead use log to output.
class AppLogging {
  factory AppLogging() {
    return _appLogging;
  }

  AppLogging._internal() {
    _init();
  }

  static final AppLogging _appLogging = AppLogging._internal();

  void _init() {
    // disable hierarchical logger
    hierarchicalLoggingEnabled = false;

    Logger.root.level = Level.ALL;

    // stack traces are expensive so we turn this on for
    // severe and above
    recordStackTraceAtLevel = Level.SEVERE;

    // just so during a log level change that we know about it.
    // log is used instead of print as this is for observable
    // logging even in release mode
    Logger.root.onLevelChanged.listen((event) {
      log('${event?.name} changed');
    });

    // now to get the log output
    Logger.root.onRecord.listen((record) {
      log(logMessageManager.buildLogMessage(record));

      if (record.level >= Level.SEVERE && kReleaseMode) {
        Sentry.captureException(
          logMessageManager.buildLogMessage(record, skipStackTrace: true),
          stackTrace: record.stackTrace,
        );
      }
    });

    // Appenders set up for color logs
    PrintAppender(formatter: const ColorFormatter())
        .attachToLogger(Logger.root);
  }
}
