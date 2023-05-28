import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/data/data_source/local/dao/calendars_dao.dart';
import 'package:flutter_todaily/data/data_source/local/database/local_database.dart';
import 'package:flutter_todaily/data/repository/calendar_repository.dart';

final calenarRepositoryProvider = Provider<CalendarRepositoryType>((ref) {
  final db = LocalDatabase();
  final dao = CalendarsDao(db);

  return CalendarRepository(dao);
}, name: 'CalendarRepositoryProvider');
