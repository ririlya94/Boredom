import 'dart:async';

import 'package:boredom/constant/constant.nav.dart';
import 'package:boredom/enum/enum.app_environment.dart';
import 'package:boredom/enum/enum.logger.dart';
import 'package:boredom/utilities/app.dart';
import 'package:boredom/utilities/app_log.dart';
import 'package:boredom/utilities/services/navigation.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  /// checking if something wrong when run the main, we can do tracing to firebase
  /// or any store online stacktrace
  runZonedGuarded(() async {
    await App.setup(env: AppEnvironment.dev);
    runApp(const ProviderScope(child: MyApp()));
  }, (Object e, StackTrace s) {
    AppLog.print(e, level: LoggerLevel.error);
    AppLog.print(s, level: LoggerLevel.error);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: NavigationService.navigationKey,
        initialRoute: ConstantNav.splashRoute,
        onGenerateRoute: ConstantNav.generateRoute,
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
      ),
    );
  }
}