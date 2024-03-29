import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/core/firebase_setting.dart';
import 'package:flutter_todaily/provider/util/provider_logger.dart';
import 'package:flutter_todaily/screen/year_calendar/main_calendar_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebaes();
  runApp(ProviderScope(observers: [ProviderLogger()], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'calendiary',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko'), // Koread
      ],
      theme: ThemeData(useMaterial3: true),
      home: const MainCalendarScreen(),
    );
  }
}
