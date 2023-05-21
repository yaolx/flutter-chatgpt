import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message(
      {super.key, required this.message, this.color = const Color(0xFFFFFFFF)});

  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            fontFamily: "Lazer84",
          ),
        ),
      ),
    );
  }
}
