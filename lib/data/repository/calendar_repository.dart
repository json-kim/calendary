import 'package:flutter_todaily/data/data_source/local/dao/calendars_dao.dart';
import 'package:flutter_todaily/data/data_source/local/mapper/calendar_list_mapper.dart';
import 'package:flutter_todaily/data/data_source/local/mapper/calendar_mapper.dart';
import 'package:flutter_todaily/model/calendar_model.dart';
import 'package:flutter_todaily/model/edit_calendar_model.dart';
import 'package:flutter_todaily/util/log_utils.dart';

abstract class CalendarRepositoryType {
  Future<int?> insertCalendar(CalendarModel calendar);
  Future<int?> insertEditCalendar(EditCalendarModel editCalendar);
  Future<bool> deleteCalendar(int calendarId);
  Future<bool> deleteAllCalendar();
  Future<int?> updateCalendar(CalendarModel calendar);
  Future<List<CalendarModel>?> selectCalendarListInYear(int year);
  Future<List<CalendarModel>?> selectCalendarListInMonth(int year, int month);
  Future<CalendarModel?> selectCalendarWithDay(DateTime date);
  Future<CalendarModel?> selectCalendarWithId(int id);

  Stream<List<CalendarModel>> watchCaledarListWithYear(int year);
}

class CalendarRepository implements CalendarRepositoryType {
  CalendarRepository(this.dao);

  final CalendarsDaoType dao;

  @override
  Future<bool> deleteAllCalendar() async {
    try {
      await dao.deleteCalendarAll();

      return true;
    } catch (e) {
      LogUtil.error(err: e);

      return false;
    }
  }

  @override
  Future<bool> deleteCalendar(int calendarId) async {
    try {
      final result = await dao.deleteCalendar(calendarId);

      return result == 1;
    } catch (e) {
      LogUtil.error(err: e);

      return false;
    }
  }

  @override
  Future<int?> insertCalendar(CalendarModel calendar) async {
    try {
      final resultId = await dao.insertCalendar(calendar.toCompanion());

      return resultId;
    } catch (e) {
      LogUtil.error(err: e);

      return null;
    }
  }

  @override
  Future<int?> insertEditCalendar(EditCalendarModel editCalendar) async {
    try {
      final resultId = await dao.insertCalendar(editCalendar.toCompanion());

      return resultId;
    } catch (e) {
      LogUtil.error(err: e);

      return null;
    }
  }

  @override
  Future<List<CalendarModel>?> selectCalendarListInMonth(
      int year, int month) async {
    try {
      final entities = await dao.selectCalendarListInMonth(year, month);

      return entities.toModelList();
    } catch (e) {
      LogUtil.error(err: e);

      return null;
    }
  }

  @override
  Future<List<CalendarModel>?> selectCalendarListInYear(int year) async {
    try {
      final entities = await dao.selectCalendarListInYear(year);

      return entities.toModelList();
    } catch (e) {
      LogUtil.error(err: e);

      return null;
    }
  }

  @override
  Future<CalendarModel?> selectCalendarWithDay(DateTime date) async {
    try {
      final entity = await dao.selectCalendarOfDate(date);

      return entity?.toModel();
    } catch (e) {
      LogUtil.error(err: e);

      return null;
    }
  }

  @override
  Future<CalendarModel?> selectCalendarWithId(int id) async {
    try {
      final entity = await dao.selectCalendarWithId(id);

      return entity?.toModel();
    } catch (e) {
      LogUtil.error(err: e);

      return null;
    }
  }

  @override
  Future<int?> updateCalendar(CalendarModel calendar) async {
    try {
      final resultId = await dao.updateCalendar(calendar.toCompanion());

      return resultId;
    } catch (e) {
      LogUtil.error(err: e);

      return null;
    }
  }

  @override
  Stream<List<CalendarModel>> watchCaledarListWithYear(int year) {
    return dao
        .watchCalendarListInYear(year)
        .map((event) => event.toModelList());
  }
}
