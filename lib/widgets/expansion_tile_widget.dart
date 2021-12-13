import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    Key? key,
    required this.color,
    required this.title,
    required this.lstWidget,
  }) : super(key: key);
  final Color color;
  final String title;
  final List<Widget> lstWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        title: Text(title),
        trailing: const Icon(Icons.more_vert),
        backgroundColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
        children: lstWidget,
      ),
    );
  }
}
