import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/penalty_bloc.dart';

class GoalView extends StatelessWidget {
  final Function(ShotDirection) onShoot;

  const GoalView({super.key, required this.onShoot});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Choose the direction of hit",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _shotButton("assets/icons/penalty/arrow_top_left.svg",
                ShotDirection.topLeft),
            const SizedBox(width: 8),
            _shotButton(
                "assets/icons/penalty/arrow_up.svg", ShotDirection.topCenter),
            const SizedBox(width: 8),
            _shotButton("assets/icons/penalty/arrow_top_right.svg",
                ShotDirection.topRight),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _shotButton(
                "assets/icons/penalty/arrow_left.svg", ShotDirection.left),
            const SizedBox(width: 8),
            _shotButton("assets/icons/penalty/arrow_down.svg",
                ShotDirection.bottomCenter),
            const SizedBox(width: 8),
            _shotButton(
                "assets/icons/penalty/arrow_right.svg", ShotDirection.right),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _shotButton(String path, ShotDirection direction) {
    return CupertinoButton(
      color: Colors.white10,
      onPressed: () => onShoot(direction),
      child: SvgPicture.asset(path),
    );
  }
}
