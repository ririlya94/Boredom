import 'package:boredom/constant/constant.nav.dart';
import 'package:boredom/enum/enum.viewstate.dart';
import 'package:boredom/utilities/providers/providers.dart';
import 'package:boredom/utilities/services/navigation.service.dart';
import 'package:boredom/utilities/services/services.dart';
import 'package:boredom/utilities/shared/view_base.controller.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// controller for the splash screen
final splashController = NotifierProvider<SplashController, ViewState>(() {
  return SplashController();
});

class SplashController extends ViewBaseController {
  late final Services _service;
  late final NavigationService _navigationService;

  @override
  ViewState build() {
    _service = ref.read(service);
    _navigationService = ref.read(navigationService);
    return ViewState.initial;
  }

  void init() async{
    setLoading();
    await _service.appInit();
    FlutterNativeSplash.remove();
    setLoaded();
    _navigation();
  }

  // use this navigation function to handle any logic of routing
  // to specific screen
  Future<void> _navigation() async {
    await _navigationService.pushAndRemoveUntil(ConstantNav.homeRoute);
  }
}