import 'package:boredom/enum/enum.app_environment.dart';
import 'package:boredom/utilities/app_log.dart';
import 'package:boredom/utilities/database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class App {
  App._();

  /// to setup any initialization of the app
  static Future<void> setup({required AppEnvironment env}) async {
    // flutter native splash
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    // init database
    await Database.init();
    // logger
    AppLog.init(kDebugMode ? 'dev' : env.name);
  }
}