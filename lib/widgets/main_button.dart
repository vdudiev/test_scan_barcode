import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Color color;
  final String title;
  final void Function() onTap;
  const MainButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: onTap,
        child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Text(title)));
  }
}
