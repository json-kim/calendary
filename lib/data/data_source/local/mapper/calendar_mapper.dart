import 'package:drift/drift.dart';
import 'package:flutter_todaily/data/data_source/local/database/local_database.dart';
import 'package:flutter_todaily/model/calendar_model.dart';
import 'package:flutter_todaily/model/edit_calendar_model.dart';

extension CalendarModelMapper on CalendarModel {
  /// 캘린더 모델을 DB에 삽입할 수 있는 객체로 변환하는 함수
  CalendarsCompanion toCompanion() {
    return CalendarsCompanion.insert(
        id: Value(id),
        title: title,
        mood: mood,
        date: date,
        content: Value(content));
  }
}

extension EditCalendarModelMapper on EditCalendarModel {
  /// 캘린더 생성 모델을 DB에 삽입할 수 있는 객체로 변환하는 함수
  CalendarsCompanion toCompanion() {
    return CalendarsCompanion.insert(
        title: title, mood: mood, date: date, content: Value(content));
  }
}

extension CalendarEntityMapper on Calendar {
  /// 캘린더 엔티티(Dao 결과값)을 캘린더 모델로 변환하는 함수
  CalendarModel toModel() {
    return CalendarModel(
        id: id, title: title, content: content, date: date, mood: mood);
  }
}
