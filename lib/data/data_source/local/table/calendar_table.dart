import 'package:drift/drift.dart';
import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';

class Calendars extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 2, max: 40)();
  TextColumn get content => text().withLength(max: 1000).nullable()();
  IntColumn get mood => intEnum<CalendarMood>()();
  DateTimeColumn get date => dateTime()();

  Expression<bool> isSameDate(DateTime otherDate) {
    return date.year.equals(otherDate.year) &
        date.month.equals(otherDate.month) &
        date.day.equals(otherDate.day);
  }
}
