import 'package:boredom/enum/enum.logger.dart';
import 'package:boredom/network/model/activity.dart';
import 'package:boredom/objectbox.g.dart';
import 'package:boredom/utilities/app_log.dart';
import 'package:boredom/utilities/database/database.dart';
import 'package:boredom/utilities/database/dto/activity.dto.dart';

class DatabaseRepository {

  List<ActivityDto>? getPastActivities() {
    return database?.activities.getAll();
  }

  List<ActivityDto>? getPastActivitiesType({required String type}) {
    final QueryBuilder<ActivityDto> queryBuilder = database!.activities.query(ActivityDto_.type.equals(type));
    return database?.activities.queryMany(queryBuilder, orderBy: ActivityDto_.activity);
  }

  void removeAllActivities() {
    database?.activities.removeAll();
  }

  void saveActivity(Activity activity) {
    final ActivityDto result = ActivityDto.toDto(activity);
    database?.activities.put(result);
  }
}