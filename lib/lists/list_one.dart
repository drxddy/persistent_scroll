import 'package:flutter/material.dart';

class ListItemsOne extends StatelessWidget {
  const ListItemsOne({super.key});

  static const itemCount = 100;

  @override
  Widget build(BuildContext context) {
    /// ListView.builder renders a scrollable list of widgets lazily,
    /// i.e,. only the widgets that exist in the viewport plus cacheExtent
    /// are rendered, so pre filling a list with 100 widgets is not necessary.
    /* 
      var list = <Widget>[];
      for (var i = 0; i <= 100; i++) {
        list.add(const ListItemWidget());
      } 
    */
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) => const _ListItemWidget());
  }
}

class _ListItemWidget extends StatefulWidget {
  const _ListItemWidget();
  @override
  State<_ListItemWidget> createState() => _ListItemWidgetState();
}

/// The state of the [_ListItemWidget]
/// using [AutomaticKeepAliveClientMixin] to keep the state of the widget
/// when it is not in the viewport.
class _ListItemWidgetState extends State<_ListItemWidget>
    with AutomaticKeepAliveClientMixin {
  static const int initialCount = 0;

  int count = initialCount;

  /// Only set to true if the widget is not in the viewport and count
  /// is not default value.
  @override
  bool get wantKeepAlive => count != initialCount;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Text(count.toString()),
            MaterialButton(
              onPressed: increment,
              child: const Text("+"),
            )
          ],
        )
      );
  }
}
