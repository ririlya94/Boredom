import 'package:boredom/network/model/activity.dart';
import 'package:boredom/network/network.repository.dart';
import 'package:boredom/utilities/database/database.repository.dart';
import 'package:boredom/utilities/database/dto/activity.dto.dart';

/// This is for to init any base services that can be used globally in any
/// related screen
class Services {
  late NetworkRepository network;
  late DatabaseRepository database;

  Services({
    required this.network,
    required this.database,
  });

  Activity? currentActivityFetch;
  List<Activity> listActivity = [];

  /// to be run when the app first run
  Future<void> appInit() async {
    /// to fetch history from db
    _loadActivityFromDb();
  }

  /// to fetch any activity
  Future<void> fetchActivity() async {
    final Activity? activity = await network.activity();
    currentActivityFetch = activity;
    if (activity != null) {
      _saveActivity(activity);
    }
  }

  /// to fetch any activity
  Future<void> fetchActivityType({required String type}) async {
    final Activity? activity = await network.activityType(type: type);
    currentActivityFetch = activity;
    if (activity != null) {
      _saveActivity(activity);
    }
  }

  void _saveActivity(Activity activity) {
    database.saveActivity(activity);
    _loadActivityFromDb();
  }

  void _loadActivityFromDb() {
    final List<ActivityDto>? result = database.getPastActivities();
    if (result != null && result.isNotEmpty) {
      final List<Activity> temp = [];
      for (var e in result) {
        temp.add(Activity.fromDto(e));
      }
      listActivity = temp;
      currentActivityFetch = listActivity.first;
    }
    else {
      listActivity = [];
    }
  }

}