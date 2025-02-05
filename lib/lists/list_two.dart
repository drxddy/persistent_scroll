import 'package:flutter/material.dart';

/// [ListItemsTwo] introduces a StatefulWidget that manages a list of items.
/// 
/// The state is not hoisted to the parent widget, and is managed by the
/// [ListItemsTwo] widget itself. 
class ListItemsTwo extends StatefulWidget {
  const ListItemsTwo({super.key});

  @override
  State<ListItemsTwo> createState() => _ListItemsTwoState();
}

class _ListItemsTwoState extends State<ListItemsTwo> {
  final List<int> _items = List.filled(100, 0);
  static const itemCount = 100;

  void _increment(int index) {
    setState(() {
      _items[index]++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return _ListItemWidget(
            index: index,
            count: _items[index],
            increment: _increment,
          );
        });
  }
}

class _ListItemWidget extends StatelessWidget {
  final int index;
  final int count;
  final void Function(int) increment;
  const _ListItemWidget(
      {required this.index,
      required this.count,
      required this.increment});

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
        ));
  }
}
