import 'dart:io';

import 'package:drift/drift.dart';
// These imports are used to open the database
import 'package:drift/native.dart';
import 'package:flutter_todaily/data/data_source/local/dao/calendars_dao.dart';
import 'package:flutter_todaily/data/data_source/local/table/calendar_table.dart';
import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'local_database.g.dart';

@DriftDatabase(tables: [Calendars], daos: [CalendarsDao])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase({NativeDatabase? nativeDatabase})
      : super(nativeDatabase ?? _openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
