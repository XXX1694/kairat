import 'package:flutter/material.dart';
import 'package:kairat/core/theme/app_pallete.dart';
import 'package:kairat/core/translations/translate.dart';

class LiveCardBottom extends StatefulWidget {
  const LiveCardBottom({super.key});

  @override
  State<LiveCardBottom> createState() => _LiveCardBottomState();
}

class _LiveCardBottomState extends State<LiveCardBottom>
    with SingleTickerProviderStateMixin {
  int _currentCount = 23437;

  @override
  void initState() {
    _startAnimation();
    super.initState();
  }

  void _startAnimation() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _currentCount += 1;
        });

        _startAnimation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String numberString = _currentCount.toString();
    String staticPart = numberString.substring(0, numberString.length - 1);
    String lastDigit = numberString.substring(numberString.length - 1);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          staticPart,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontFamily: 'Proxima Nova',
            color: AppPallete.primaryColor,
          ),
        ),
        SizedBox(
          width: 8,
          height: 20,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.5),
                      end: const Offset(0, 0),
                    ).animate(animation),
                    child: FadeTransition(opacity: animation, child: child),
                  ),
                ],
              );
            },
            child: Text(
              lastDigit,
              key: ValueKey<String>(lastDigit),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                fontFamily: 'Proxima Nova',
                color: AppPallete.primaryColor,
              ),
            ),
          ),
        ),
        Text(
          ' ${translation(context).fans_voated}',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: 'Proxima Nova',
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}
