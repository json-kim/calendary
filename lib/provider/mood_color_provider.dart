import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/util/mood_color_theme.dart';

final moodColorThemeProvider = Provider<MoodColorTheme>(
    (ref) => defaultColorTheme,
    name: 'MoodColorThemeProvider');
