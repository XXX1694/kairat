import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/penalty_bloc.dart';

class Goalkeeper extends StatelessWidget {
  final ShotDirection direction;

  const Goalkeeper({super.key, required this.direction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "The goalkeeper jumped in:",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white54,
              ),
        ),
        const SizedBox(height: 8),
        SvgPicture.asset(
          _getIcon(direction),
          height: 60,
          width: 60,
        ),
      ],
    );
  }

  String _getIcon(ShotDirection direction) {
    switch (direction) {
      case ShotDirection.topLeft:
        return 'assets/icons/penalty/arrow_top_left.svg';
      case ShotDirection.topCenter:
        return 'assets/icons/penalty/arrow_up.svg';
      case ShotDirection.topRight:
        return 'assets/icons/penalty/arrow_top_right.svg';
      case ShotDirection.left:
        return 'assets/icons/penalty/arrow_left.svg';
      case ShotDirection.bottomCenter:
        return 'assets/icons/penalty/arrow_down.svg';
      case ShotDirection.right:
        return 'assets/icons/penalty/arrow_top_right.svg';
    }
  }
}
