import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kairat/features/news/presentation/bloc/news_bloc.dart';
import 'package:kairat/features/penalty-game/data/penalty_repository.dart';
import 'package:kairat/features/penalty-game/presentation/bloc/penalty_bloc.dart';

import 'core/router/go_router.dart';
import 'core/theme/theme.dart';
import 'core/translations/l10n.dart';
import 'core/translations/language_contants.dart';
import 'features/news/domain/repositories/news_repository.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MainAppState? state = context.findAncestorStateOfType<_MainAppState>();
    state?.setLocale(newLocale);
  }
}

class _MainAppState extends State<MainApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((value) => setLocale(value));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsBloc(NewsRepository()),
        ),
        BlocProvider(
          create: (context) => PenaltyBloc(PenaltyRepository()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'FC Kairat',
        theme: AppTheme.darkThemeMode,
        routerConfig: goRouter,
        supportedLocales: L10n.all,
        locale: _locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    );
  }
}
