import 'package:flutter/material.dart';

class SlideOutMenu extends StatelessWidget {
  final List<Widget> menuItems;
  final Widget header;
  final Widget footer;

  const SlideOutMenu({
    Key? key,
    required this.menuItems,
    this.header = const SizedBox.shrink(),
    this.footer = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          header,
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: menuItems,
            ),
          ),
          footer,
        ],
      ),
    );
  }
}
