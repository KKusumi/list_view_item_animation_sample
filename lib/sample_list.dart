import 'package:flutter/material.dart';
import 'package:list_view_item_animation/sample_list_item.dart';

class SampleList extends StatefulWidget {
  const SampleList({super.key, required this.nameList});

  final List<String> nameList;

  @override
  State<StatefulWidget> createState() => SampleListState();
}

class SampleListState extends State<SampleList> {
  final List<GlobalObjectKey<SampleListItemState>> keys = [];

  @override
  void initState() {
    super.initState();
    for (var name in widget.nameList) {
      keys.add(GlobalObjectKey(name));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      itemBuilder: (context, index) {
        return SampleListItem(key: keys[index], name: widget.nameList[index]);
      },
      separatorBuilder: (_, __) {
        return const SizedBox(height: 8);
      },
      itemCount: widget.nameList.length,
    );
  }

  void animate(int index) {
    keys[index].currentState?.animate();
  }
}
