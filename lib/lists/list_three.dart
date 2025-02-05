import 'package:flutter/material.dart';

/// [ListController] introduces a ChangeNotifier that manages a list of items.
/// 
/// The state is hoisted to the parent widget, and is managed by the
/// [ListController] widget itself.
class ListController extends ChangeNotifier {
  final List<int> items = List.filled(100, 0);
  static const itemCount = 100;

  void increment(int index) {
    items[index]++;
    notifyListeners();
  }
}

/// [ListItemsThree] improves upon [ListItemsTwo] by hoisting the state to a
/// ChangeNotifier class.
/// 
/// The state is managed by the [ListController] class, and the list view is
/// wrapped in a [ListenableBuilder] widget that listens to the [ListController]
/// and rebuilds the list view when the controller notifies its listeners.
class ListItemsThree extends StatelessWidget {
  ListItemsThree({super.key});

  final ListController controller = ListController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return ListView.builder(
          itemCount: ListController.itemCount,
          itemBuilder: (context, index) {
            return _ListItemWidget(
              index: index,
              count: controller.items[index],
              increment: controller.increment,
            );
          },
        );
      },
    );
  }
}

class _ListItemWidget extends StatelessWidget {
  final int index;
  final int count;
  final void Function(int) increment;
  
  const _ListItemWidget({
    required this.index,
    required this.count,
    required this.increment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text(count.toString()),
          MaterialButton(
            onPressed: () => increment(index),
            child: const Text("+"),
          )
        ],
      ),
    );
  }
}
