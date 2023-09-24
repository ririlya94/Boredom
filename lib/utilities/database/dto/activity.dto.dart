import 'package:boredom/network/model/activity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ActivityDto {
  @Id()
  late int boxId = 0;
  String activity = '';
  double accessibility = 0.0;
  String type = '';
  int participants = 0;
  double price = 0.0;
  String? link;
  String? key;

  ActivityDto();

  ActivityDto.toDto(Activity data) {
    activity = data.activity;
    accessibility = data.accessibility;
    type = data.type;
    participants = data.participants;
    price = data.price;
    link = data.link;
    key = data.key;
  }

}