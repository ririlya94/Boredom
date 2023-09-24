import 'package:boredom/constant/constant.nav.dart';
import 'package:boredom/enum/enum.viewstate.dart';
import 'package:boredom/network/model/activity.dart';
import 'package:boredom/utilities/providers/providers.dart';
import 'package:boredom/utilities/services/navigation.service.dart';
import 'package:boredom/utilities/services/services.dart';
import 'package:boredom/utilities/shared/view_base.controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeController = NotifierProvider<HomeController, ViewState>(() {
  return HomeController();
});

final _currentActivity = StateProvider<Activity?>((ref) {
  return null;
});

final _currentListActivity = StateProvider<List<Activity>>((ref) {
  return [];
});

final _currentSelection = StateProvider<String>((ref) => '');

class HomeController extends ViewBaseController {
  late final Services _services;
  late final NavigationService _navigationService;

  @override
  ViewState build() {
    _services = ref.read(service);
    _navigationService = ref.read(navigationService);
    return ViewState.initial;
  }


  Activity? get getCurrentActivity => ref.watch(_currentActivity.notifier).state;
  List<Activity> get getListActivity => ref.watch(_currentListActivity.notifier).state;
  String get getCurrentSelection => ref.watch(_currentSelection.notifier).state;

  void init() async{
    setLoading();
    ref.read(_currentActivity.notifier).state = _services.currentActivityFetch;
    ref.read(_currentListActivity.notifier).state = _services.listActivity;
    setLoaded();
  }

  void fetchActivity() async {
    setLoading();
    if (getCurrentSelection.isNotEmpty) {
      await _services.fetchActivityType(type: getCurrentSelection);
    }
    else {
      await _services.fetchActivity();
    }
    ref.read(_currentActivity.notifier).state = _services.currentActivityFetch;
    ref.read(_currentListActivity.notifier).state = _services.listActivity;
    setLoaded();
  }

  void navigationToHistory() async {
    _navigationService.navigateTo(ConstantNav.historyRoute);
  }

  void setSelection(String value) {
    setLoading();
    ref.read(_currentSelection.notifier).state = value;
    setLoaded();
  }
}