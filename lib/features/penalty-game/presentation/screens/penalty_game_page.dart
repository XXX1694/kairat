import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/translations/translate.dart';
import '../../data/penalty_repository.dart';
import '../bloc/penalty_bloc.dart';

import '../bloc/penalty_event.dart';
import '../bloc/penalty_state.dart';
import '../widgets/attempts_left.dart';
import '../widgets/goal_view.dart';
import '../widgets/goalkeeper.dart';

class PenaltyGamePage extends StatelessWidget {
  const PenaltyGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PenaltyBloc(PenaltyRepository())..add(LoadAttempts()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            translation(context).mini_game,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        body: Center(
          child: BlocConsumer<PenaltyBloc, PenaltyState>(
            listener: (context, state) {
              if (state is PenaltyResult && state.isLastAttempt) {
                Future.delayed(Duration(seconds: 2), () {
                  // ignore: use_build_context_synchronously
                  showAttemptsEndedDialog(context);
                });
              }
            },
            builder: (context, state) {
              if (state is PenaltyLoaded || state is PenaltyResult) {
                final int attempts = (state is PenaltyLoaded)
                    ? state.attemptsLeft
                    : (state as PenaltyResult).attemptsLeft;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AttemptsLeft(attempts: attempts),
                    Expanded(
                      child: (state is PenaltyResult)
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.isGoal ? "GOAL! 🎉" : "Hit back! 🧤",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                Goalkeeper(
                                    direction: state.goalkeeperDirection),
                              ],
                            )
                          : Column(
                              children: [
                                Expanded(
                                  child: attempts == 0
                                      ? Center(
                                          child: Text(
                                            'Come back tomorrow!',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      : Text(''),
                                ),
                              ],
                            ),
                    ),
                    if (attempts > 0)
                      GoalView(
                          onShoot: (dir) =>
                              context.read<PenaltyBloc>().add(ShootBall(dir))),
                  ],
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

void showAttemptsEndedDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text("The attempts are over"),
      content: Text("Come back tomorrow!"),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          child: Text("ОК"),
        ),
      ],
    ),
  );
}
