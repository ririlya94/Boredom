import 'package:boredom/constant/constant.string.dart';
import 'package:boredom/enum/enum.viewstate.dart';
import 'package:boredom/network/model/activity.dart';
import 'package:boredom/ui/screen/home/home.controller.dart';
import 'package:boredom/ui/shared/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(homeController.notifier).init());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: const Text(ConstantString.homes),
        ),
        body: _buildBody()
    );
  }

  Widget _buildBody() {
    final ViewState state = ref.watch(homeController);
    final Activity? activity = ref.watch(homeController.notifier).getCurrentActivity;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (state == ViewState.loaded) ?
          Text(
            activity == null ? ConstantString.activity :
            ConstantString.activityUpdate(
                name: activity.activity,
                price: activity.price.toString()
            ),
            style: const TextStyle(
              fontSize: 18
            ),
          )
              :
          const CircularProgressIndicator(),
          const SizedBox(height: 100),

          DropdownMenu<String>(
          initialSelection: ConstantString.dropdownChoices.keys.elementAt(0),
          onSelected: (String? value) {
            ref.read(homeController.notifier).setSelection(value ?? '');
          },
          dropdownMenuEntries: ConstantString.dropdownChoices.keys.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: ConstantString.dropdownChoices[value] ?? '', label: value);
          }).toList(),
        ),
          const SizedBox(height: 30),

          Button(
              buttonText: ConstantString.next,
              buttonColor: Colors.blue,
              isLoading: (state == ViewState.loaded) ? false : true,
              loadingColor: Colors.white,
              onPressed: (_) => ref.read(homeController.notifier).fetchActivity()
          ),

          const SizedBox(height: 10),
          Button(
              buttonText: ConstantString.history,
              buttonColor: Colors.orange,
              onPressed: (_) => ref.read(homeController.notifier).navigationToHistory()
          ),

        ],
      ),
    );
  }
}