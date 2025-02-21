import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kairat/core/theme/app_pallete.dart';
import 'package:kairat/core/translations/translate.dart';

class LiveCardVoater extends StatelessWidget {
  const LiveCardVoater({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppPallete.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              child: Center(
                child: Text(
                  'FC Kairat',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Proxima Nova',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 35,
            width: 1,
            color: Colors.white10,
          ),
          const SizedBox(width: 20),
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            child: Text(
              translation(context).draw,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Proxima Nova',
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            height: 35,
            width: 1,
            color: Colors.white10,
          ),
          Expanded(
            child: CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              child: Center(
                child: Text(
                  'FC Astana',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Proxima Nova',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
