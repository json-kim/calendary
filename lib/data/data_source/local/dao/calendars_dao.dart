import 'package:drift/drift.dart';
import 'package:flutter_todaily/data/data_source/local/database/local_database.dart';
import 'package:flutter_todaily/data/data_source/local/table/calendar_table.dart';

part 'calendars_dao.g.dart';

abstract class CalendarsDaoType {
  Future<int> insertCalendar(CalendarsCompanion calendar);
  Future<int> deleteCalendar(int id);
  Future<int> updateCalendar(CalendarsCompanion newCalendar);
  Future<List<Calendar>> selectCalendarListInYear(int year);
  Future<List<Calendar>> selectCalendarListInMonth(int year, int month);
  Future<Calendar?> selectCalendarOfDate(DateTime otherDate);
  Future<Calendar?> selectCalendarWithId(int id);
  Future<int> deleteCalendarAll();
}

@DriftAccessor(tables: [Calendars])
class CalendarsDao extends DatabaseAccessor<LocalDatabase>
    with _$CalendarsDaoMixin
    implements CalendarsDaoType {
  CalendarsDao(super.attachedDatabase);

  /// 캘린더 삽입
  @override
  Future<int> insertCalendar(CalendarsCompanion calendar) {
    return into(calendars).insert(calendar, mode: InsertMode.insertOrReplace);
  }

  /// 캘린더 제거
  @override
  Future<int> deleteCalendar(int id) async {
    return (delete(calendars)..where((tbl) => tbl.id.equals(id))).go();
  }

  /// 캘린더 수정
  @override
  Future<int> updateCalendar(CalendarsCompanion newCalendar) async {
    return (update(calendars)
          ..where((tbl) => tbl.id.equals(newCalendar.id.value)))
        .write(newCalendar);
  }

  /// 캘린더 가져오기 with year
  @override
  Future<List<Calendar>> selectCalendarListInYear(int year) {
    return (select(calendars)
          ..where((tbl) => tbl.date
              .modify(const DateTimeModifier.localTime())
              .year
              .equals(year)))
        .get();
  }

  /// 캘린더 가져오기 with year & month
  @override
  Future<List<Calendar>> selectCalendarListInMonth(int year, int month) {
    return (select(calendars)
          ..where((tbl) =>
              tbl.date
                  .modify(const DateTimeModifier.localTime())
                  .month
                  .equals(month) &
              tbl.date
                  .modify(const DateTimeModifier.localTime())
                  .year
                  .equals(year)))
        .get();
  }

  /// 캘린더 가져오기 with date
  @override
  Future<Calendar?> selectCalendarOfDate(DateTime otherDate) {
    return (select(calendars)..where((tbl) => tbl.isSameDate(otherDate)))
        .getSingleOrNull();
  }

  /// 캘린더 가져오기 with id
  @override
  Future<Calendar?> selectCalendarWithId(int id) {
    return (select(calendars)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  /// 캘린더 전부 제거하기
  @override
  Future<int> deleteCalendarAll() {
    return delete(calendars).go();
  }
}
