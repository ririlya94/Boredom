import 'package:boredom/enum/enum.logger.dart';
import 'package:boredom/utilities/app_log.dart';
import 'package:boredom/utilities/database/dto/activity.dto.dart';

class Activity {
  String activity = '';
  double accessibility = 0.0;
  String type = '';
  int participants = 0;
  double price = 0.0;
  String? link;
  String? key;

  Activity({
    required this.activity,
    required this.accessibility,
    required this.type,
    required this.participants,
    required this.price,
    this.link,
    this.key,
  });

  Activity.fromJson(Map<String, dynamic> json) {
    AppLog.print(json,level: LoggerLevel.wtf);
    activity = json['activity'];

    /// need to do conversion to double because the api sometimes returning double or int
    num accessibilityNum = json['accessibility'];
    accessibility = accessibilityNum.toDouble();
    num priceNum = json['accessibility'];
    price = priceNum.toDouble();

    type = json['type'];
    participants = json['participants'];
    link = json['link'];
    key = json['key'];
  }

  Activity.fromDto(ActivityDto data) {
    activity = data.activity;
    accessibility = data.accessibility;
    type = data.type;
    participants = data.participants;
    price = data.price;
    link = data.link;
    key = data.key;
  }
}