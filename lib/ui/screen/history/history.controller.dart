import 'package:boredom/enum/enum.viewstate.dart';
import 'package:boredom/network/model/activity.dart';
import 'package:boredom/utilities/providers/providers.dart';
import 'package:boredom/utilities/services/services.dart';
import 'package:boredom/utilities/shared/view_base.controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyController = NotifierProvider<HistoryController, ViewState>(() {
  return HistoryController();
});

class HistoryController extends ViewBaseController {
  late final Services _services;

  @override
  ViewState build() {
    _services = ref.read(service);
    return ViewState.initial;
  }

  List<Activity> getListActivity = [];

  void init() async {
    setLoading();
    getListActivity = _services.listActivity;
    setLoaded();
  }
}