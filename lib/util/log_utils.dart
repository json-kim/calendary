import 'package:flutter/widgets.dart';

class LogUtil {
  static final List<String> _logs = [];

  static void log(String message) {
    final logMessage = '[🐛LOG] $message';
    _logs.add(logMessage);
    debugPrint(logMessage);
  }

  static void error(Object err, String errMessage) {
    final logMessage = '[🚫ERR] $errMessage, $err';
    _logs.add(errMessage);
    debugPrint(logMessage);
  }
}
