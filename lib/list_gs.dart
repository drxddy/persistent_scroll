import 'package:flutter/material.dart';

class ListItems extends StatefulWidget {
  const ListItems({super.key});

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
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
      return ListItemWidget(
        index: index,
        count: _items[index],
        increment: _increment,
      );
    });
  }
}

class ListItemWidget extends StatelessWidget {
  final int index;
  final int count;
  final void Function(int) increment;
  const ListItemWidget(
      {super.key,
      required this.index,
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
