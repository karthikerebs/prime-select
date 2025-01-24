import 'package:logger/logger.dart';

class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  late Logger _logger;

  factory AppLogger() {
    return _instance;
  }

  AppLogger._internal() {
    _logger = Logger(
      printer: CustomPrinter(),
      output: CustomOutput(),
    );
  }

  void debug(dynamic message) {
    _logger.d('\x1B[36m$message\x1B[0m'); // Cyan
  }

  void info(dynamic message) {
    _logger.i('\x1B[32m$message\x1B[0m'); // Green
  }

  void warning(dynamic message) {
    _logger.w('\x1B[33m$message\x1B[0m'); // Yellow
  }

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e('\x1B[31m$message\x1B[0m',
        error: error, stackTrace: stackTrace); // Red
  }

  void trace(dynamic message) {
    _logger.t('\x1B[35m$message\x1B[0m'); // Magenta
  }

  void fatal(dynamic message) {
    _logger
        .f('\x1B[37m\x1B[41m$message\x1B[0m'); // White text on red background
  }
}

class CustomPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [event.message as String];
  }
}

class CustomOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      // ignore: avoid_print
      print(line);
    }
  }
}
