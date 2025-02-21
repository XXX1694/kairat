import 'package:flutter/material.dart';

class LiveCardTop extends StatelessWidget {
  const LiveCardTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "QFL",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Proxima Nova',
            color: Colors.white,
          ),
        ),
        Text(
          "Match-day 2",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Proxima Nova',
            color: Colors.white54,
          ),
        )
      ],
    );
  }
}
