import 'package:flutter/material.dart';
import 'package:kairat/core/translations/translate.dart';

class SecondText extends StatelessWidget {
  const SecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Text(
        textAlign: TextAlign.center,
        translation(context).welcome_second_text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
