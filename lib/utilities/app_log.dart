import 'package:boredom/enum/enum.logger.dart';
import 'package:logger/logger.dart';


class AppLog {
  AppLog();

  static String? env;

  static void init(String env) => AppLog.env = env;

  static void print(dynamic value, {
    LoggerLevel level = LoggerLevel.debug,
    bool isIgnoreEnv = false,
  }) {
    if (env != 'dev' && !isIgnoreEnv) return;
    final Logger logger = Logger(
      printer: PrettyPrinter(
          methodCount: 2,
          // number of method calls to be displayed
          errorMethodCount:
          8,
          // number of method calls if stacktrace is provided
          lineLength: 120,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: true // Should each log print contain a timestamp
      ),
    );

    switch (level) {
      case LoggerLevel.debug:
        return logger.d(value);
      case LoggerLevel.verbose:
        return logger.t(value);
      case LoggerLevel.info:
        return logger.i(value);
      case LoggerLevel.warning:
        return logger.w(value);
      case LoggerLevel.error:
        return logger.e(value);
      case LoggerLevel.wtf:
        return logger.f(value);

      default:
        return logger.d(value);
    }
  }
}
