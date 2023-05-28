import 'package:drift/drift.dart';
import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';

class Calendars extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 2, max: 40)();
  TextColumn get content => text().withLength(max: 1000).nullable()();
  IntColumn get mood => intEnum<CalendarMood>()();
  DateTimeColumn get date => dateTime()();

  Expression<bool> isSameDate(DateTime otherDate) {
    final localDate = date.modify(const DateTimeModifier.localTime());
    return localDate.year.equals(otherDate.year) &
        localDate.month.equals(otherDate.month) &
        localDate.day.equals(otherDate.day);
  }
}
