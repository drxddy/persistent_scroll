import 'package:flutter/material.dart';

// Controller class with ChangeNotifier
class ListController extends ChangeNotifier {
  final List<int> items = List.filled(100, 0);
  static const itemCount = 100;

  void increment(int index) {
    items[index]++;
    notifyListeners();
  }
}

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
