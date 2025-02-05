import 'package:flutter/material.dart';

class _ListController extends ChangeNotifier {
  static final _ListController _instance = _ListController._internal();
  factory _ListController() => _instance;
  _ListController._internal() : items = List.filled(itemCount, 0);

  final List<int> items;
  static const int itemCount = 100;

  void increment(int index) {
    if (index < 0 || index >= itemCount) return;
    items[index]++;
    notifyListeners();
  }

  void reset() {
    items.fillRange(0, itemCount, 0);
    notifyListeners();
  }
}

class ListItemsFour extends StatefulWidget {
  const ListItemsFour({super.key});

  @override
  State<ListItemsFour> createState() => _ListItemsFourState();
}

class _ListItemsFourState extends State<ListItemsFour> {
  late final _ListController controller;

  @override
  void initState() {
    super.initState();
    controller = _ListController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.reset,
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return ListView.builder(
            itemCount: _ListController.itemCount,
            itemBuilder: (context, index) => _ListItemWidget(
              index: index,
              count: controller.items[index],
              increment: controller.increment,
            ),
          );
        },
      ),
    );
  }
}

class _ListItemWidget extends StatelessWidget {
  final int index;
  final int count;
  final ValueChanged<int> increment;

  const _ListItemWidget({
    required this.index,
    required this.count,
    required this.increment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              'Item ${index + 1}: $count',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            IconButton(
              onPressed: () => increment(index),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
