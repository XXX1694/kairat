import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kairat/core/theme/app_pallete.dart';

import '../widgets/main_text.dart';
import '../widgets/second_text.dart';
import '../widgets/start_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: Column(
        children: [
          const Spacer(),
          MainText(),
          const SizedBox(height: 32),
          SecondText(),
          const SizedBox(height: 48),
          StartButton(),
          Image.asset(
            'assets/images/dastan.png',
            height: 350,
          ),
        ],
      ),
    );
  }
}
