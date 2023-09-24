import 'package:boredom/constant/constant.api.dart';
import 'package:boredom/network/api.dart';
import 'package:boredom/network/custom_deserialize.dart';
import 'package:boredom/network/model/activity.dart';

/// repository for url specific call for the [Api]
class NetworkRepository extends Api {
  NetworkRepository() : super();

  // a
  Future<Activity?> activity() async {
    const String url = ConstantApi.activity;
    final dynamic json = await get(url);
    final Activity? obj = CustomDeserialize<Activity>(
      json,
      fromJson: (e, {callback}) => Activity.fromJson(e),
    ).item;
    return obj;
  }

  Future<void> activityKey({required String key}) async{
    String url = ConstantApi.activity;
    final Map<String, String> queryParam = {
      'key': key
    };
    final dynamic json = await get(url,queryParam: queryParam);
    final dynamic testObject = CustomDeserialize(json).item;
  }

  Future<Activity?> activityType({required String type}) async{
    String url = ConstantApi.activity;
    final Map<String, String> queryParam = {
      'type': type
    };
    final dynamic json = await get(url,queryParam: queryParam);
    final Activity? obj = CustomDeserialize<Activity>(
      json,
      fromJson: (e, {callback}) => Activity.fromJson(e),
    ).item;
    return obj;
  }

  // for personal future usage
  Future<void> getParamExample1({
    required Map<String, String> queryParam
  }) async {
    const String url = ConstantApi.activity;
    final dynamic json = await get(url,queryParam: queryParam);
    final dynamic testObject = CustomDeserialize(json).item;
    // return testObject;
  }

  Future<void> getParamExample2({
    required String name,
    required int age,
    required String job
  }) async {
    const String url = ConstantApi.activity;
    final Map<String, String> queryParam = {
      'name': name,
      'age': age.toString(),
      'job': job
    };
    final dynamic json = await get(url,queryParam: queryParam);
    final dynamic testObject = CustomDeserialize(json).item;
    // return testObject;
  }
}