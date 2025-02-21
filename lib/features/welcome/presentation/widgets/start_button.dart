import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kairat/core/translations/translate.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Container(
        height: 52,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                translation(context).start,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset('assets/icons/arrow_right.svg'),
              ),
            )
          ],
        ),
      ),
      onPressed: () {
        context.go('/main');
      },
    );
  }
}
