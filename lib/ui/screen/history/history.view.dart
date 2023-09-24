import 'package:boredom/constant/constant.string.dart';
import 'package:boredom/enum/enum.viewstate.dart';
import 'package:boredom/network/model/activity.dart';
import 'package:boredom/ui/screen/history/history.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryView extends ConsumerStatefulWidget {
  const HistoryView({super.key});

  @override
  ConsumerState createState() => HistoryViewState();
}

class HistoryViewState extends ConsumerState<HistoryView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(historyController.notifier).init());
  }

  @override
  Widget build(BuildContext context) {
    final ViewState viewState = ref.watch(historyController);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(ConstantString.history),
        ),
        body:
        (viewState == ViewState.loaded)
            ?
        _buildBody()
      : const Center(child: CircularProgressIndicator())
    );
  }

  Widget _buildBody() {
    final List<Activity> listActivity = ref.watch(historyController.notifier).getListActivity;
    return listActivity.isNotEmpty ?
    ListView.builder(
      itemCount: listActivity.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Activity ${listActivity[index].activity}'),
              Text('Accessibility: ${listActivity[index].accessibility}'),
              Text('Type: ${listActivity[index].type}'),
              Text('Participants: ${listActivity[index].participants}'),
              Text('Price: ${listActivity[index].price}'),
              Text('Link: ${listActivity[index].link ?? '-'}'),
              Text('Link: ${listActivity[index].key ?? '-'}'),
              const SizedBox(height: 10),
              Container(height: 1, width: MediaQuery.of(context).size.width,color: Colors.deepPurpleAccent,)
            ],
          ),
        );
      },
    )
        :
    const Text(
      ConstantString.emptyHistory,
      style: TextStyle(
          fontSize: 18
      ),
    );
  }
}