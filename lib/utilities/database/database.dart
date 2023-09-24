import 'dart:io';

import 'package:boredom/enum/enum.logger.dart';
import 'package:boredom/objectbox.g.dart';
import 'package:boredom/utilities/app_log.dart';
import 'package:boredom/utilities/database/database_box.dart';
import 'package:boredom/utilities/database/dto/activity.dto.dart';
import 'package:path_provider/path_provider.dart';

Database? database = null;

class Database {
  /// The Store of this app.
  late final Store _store;
  late final DatabaseBox<ActivityDto> activities;

  Database._create(this._store) {
    activities = DatabaseBox<ActivityDto>(_store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<Database> create() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    // openStore() is defined in the generated objectbox.g.dart
    final Store store = await openStore(directory: directory.path);
    return Database._create(store);
  }

  /// The best time to initialize ObjectBox is when your app starts.
  /// [SplashController.runStartup()]
  static Future<void> init() async {
    try {
      database = await Database.create(); // Singleton Factory
    } catch (e, s) {
      AppLog.print('init database: ', level: LoggerLevel.error);
    }
  }
}