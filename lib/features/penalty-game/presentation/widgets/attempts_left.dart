import 'package:flutter/material.dart';

class AttemptsLeft extends StatelessWidget {
  const AttemptsLeft({
    super.key,
    required this.attempts,
  });
  final int attempts;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Attempts left: $attempts",
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
