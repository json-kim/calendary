import 'package:drift/drift.dart';
import 'package:flutter_todaily/data/data_source/local/database/local_database.dart';
import 'package:flutter_todaily/data/data_source/local/table/calendar_table.dart';

part 'calendars_dao.g.dart';

@DriftAccessor(tables: [Calendars])
class CalendarsDao extends DatabaseAccessor<LocalDatabase>
    with _$CalendarsDaoMixin {
  CalendarsDao(super.attachedDatabase);

  /// 캘린더 삽입
  Future<int> insertCalendar(CalendarsCompanion calendar) {
    return into(calendars).insert(calendar, mode: InsertMode.insertOrReplace);
  }

  /// 캘린더 제거
  Future<int> deleteCalendar(int id) async {
    return (delete(calendars)..where((tbl) => tbl.id.equals(id))).go();
  }

  /// 캘린더 수정
  Future<int> updateCalendar(CalendarsCompanion newCalendar) async {
    return (update(calendars)
          ..where((tbl) => tbl.id.equals(newCalendar.id.value)))
        .write(newCalendar);
  }

  /// 캘린더 가져오기 with year
  Future<List<Calendar>> selectCalendarListInYear(int year) {
    return (select(calendars)
          ..where((tbl) => tbl.date
              .modify(const DateTimeModifier.localTime())
              .year
              .equals(year)))
        .get();
  }

  /// 캘린더 가져오기 with month
  Future<List<Calendar>> selectCalendarListInMonth(int month) {
    return (select(calendars)
          ..where((tbl) => tbl.date
              .modify(const DateTimeModifier.localTime())
              .month
              .equals(month)))
        .get();
  }

  /// 캘린더 가져오기 with date
  Future<Calendar?> selectCalendarOfDate(DateTime otherDate) {
    return (select(calendars)..where((tbl) => tbl.isSameDate(otherDate)))
        .getSingleOrNull();
  }

  /// 캘린더 가져오기 with id
  Future<Calendar?> selectCalendarWithId(int id) {
    return (select(calendars)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  /// 캘린더 전부 제거하기
  Future<int> deleteCalendarAll() {
    return delete(calendars).go();
  }
}
