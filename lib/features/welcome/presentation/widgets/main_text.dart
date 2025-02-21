import 'package:flutter/material.dart';
import 'package:kairat/core/theme/app_pallete.dart';
import 'package:kairat/core/translations/translate.dart';

class MainText extends StatelessWidget {
  const MainText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: translation(context).welcome_main_text1,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            TextSpan(
              text: translation(context).welcome_main_text2,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppPallete.primaryColor,
                  ),
            ),
            TextSpan(
              text: translation(context).welcome_main_text3,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
