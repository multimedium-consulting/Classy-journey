import 'package:classy/config/config.dart';
import 'package:classy/core/core.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Flutter Demo',
      theme: AppTheme.light,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
