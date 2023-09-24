import 'package:boredom/ui/screen/splash/splash.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// a view for initialization of the app + logo remove when the init is done
class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState createState() => SplashViewState();
}

class SplashViewState extends ConsumerState<SplashView> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(splashController.notifier).init());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}