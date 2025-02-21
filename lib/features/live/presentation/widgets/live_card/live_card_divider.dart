import 'package:flutter/material.dart';
import 'package:kairat/core/translations/translate.dart';

class LiveCardDivider extends StatelessWidget {
  const LiveCardDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.white10,
            height: 1,
            width: double.infinity,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          translation(context).who_will_win,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            fontFamily: 'Proxima Nova',
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            color: Colors.white10,
            height: 1,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
