import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todaily/data/data_source/local/dao/calendars_dao.dart';
import 'package:flutter_todaily/data/data_source/local/mapper/calendar_list_mapper.dart';
import 'package:flutter_todaily/data/data_source/local/mapper/calendar_mapper.dart';
import 'package:flutter_todaily/data/repository/calendar_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../data_source/local/mapper/calendar_mapper_test.dart';

import 'calendar_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CalendarsDaoType>()])
void main() {
  final Faker faker = Faker();
  final dao = MockCalendarsDaoType();
  final repository = CalendarRepository(dao);

  group('(Repository) CalendarsRepository 테스트 :', () {
    test('insertCalendar() 캘린더 모델을 저장한다. 성공시, 캘린더의 id를 리턴한다.', () async {
      final calendar = getMockCalendarModel();

      when(dao.insertCalendar(calendar.toCompanion()))
          .thenAnswer((_) async => calendar.id);

      final result = await repository.insertCalendar(calendar);

      expect(result, calendar.id);
    });

    test('insertCalendar() 캘린더 모델을 저장한다. 실패시, null 값을 리턴한다.', () async {
      final calendar = getMockCalendarModel();

      when(dao.insertCalendar(calendar.toCompanion()))
          .thenThrow(Exception('저장 실패'));

      final result = await repository.insertCalendar(calendar);

      expect(result, null);
    });

    test('insertEditCalendar() 캘린더 생성 모델을 저장한다. 성공시, 캘린더의 id를 리턴한다.', () async {
      final generatedId = faker.randomGenerator.integer(1000000);
      final editCalendar = getMockEditCalendarModel();

      when(dao.insertCalendar(editCalendar.toCompanion()))
          .thenAnswer((_) async => generatedId);

      final result = await repository.insertEditCalendar(editCalendar);

      expect(result, generatedId);
    });

    test('insertEditCalendar() 캘린더 생성 모델을 저장한다. 실패시, null 값을 리턴한다.', () async {
      final editCalendar = getMockEditCalendarModel();

      when(dao.insertCalendar(editCalendar.toCompanion()))
          .thenThrow(Exception('저장 실패'));

      final result = await repository.insertEditCalendar(editCalendar);

      expect(result, null);
    });

    test('updateCalendar() 캘린더 모델을 수정한다. 성공시, 캘린더의 id를 리턴한다.', () async {
      final calendar = getMockCalendarModel();

      when(dao.updateCalendar(calendar.toCompanion()))
          .thenAnswer((_) async => calendar.id);

      final result = await repository.updateCalendar(calendar);

      expect(result, calendar.id);
    });

    test('updateCalendar() 캘린더 모델을 수정한다. 실패시, null 값을 리턴한다.', () async {
      final calendar = getMockCalendarModel();

      when(dao.updateCalendar(calendar.toCompanion()))
          .thenThrow(Exception('수정 실패'));

      final result = await repository.updateCalendar(calendar);

      expect(result, null);
    });

    test('deleteCalendar() 저장된 캘린더 모델을 삭제한다. 성공시, true 값을 리턴한다.', () async {
      final calendarId = faker.randomGenerator.integer(1000000);

      when(dao.deleteCalendar(calendarId)).thenAnswer((_) async => 1);

      final result = await repository.deleteCalendar(calendarId);

      expect(result, true);
    });

    test('deleteCalendar() 저장된 캘린더 모델을 삭제한다. 저장된 캘린더가 없을 시, false 값을 리턴한다.',
        () async {
      final calendarId = faker.randomGenerator.integer(1000000);

      when(dao.deleteCalendar(calendarId)).thenAnswer((_) async => 0);

      final result = await repository.deleteCalendar(calendarId);

      expect(result, false);
    });

    test('deleteCalendar() 저장된 캘린더 모델을 삭제한다. 실패시, false 값을 리턴한다.', () async {
      final calendarId = faker.randomGenerator.integer(1000000);

      when(dao.deleteCalendar(calendarId)).thenThrow(Exception('삭제 실패'));

      final result = await repository.deleteCalendar(calendarId);

      expect(result, false);
    });

    test('deleteAllCalendar() 모든 저장된 캘린더 모델을 삭제한다. 성공시, true 값을 리턴한다.',
        () async {
      when(dao.deleteCalendarAll()).thenAnswer((_) async => 100);

      final result = await repository.deleteAllCalendar();

      expect(result, true);
    });

    test('deleteAllCalendar() 모든 저장된 캘린더 모델을 삭제한다. 실패시, false 값을 리턴한다.',
        () async {
      when(dao.deleteCalendarAll()).thenThrow(Exception('삭제 실패'));

      final result = await repository.deleteAllCalendar();

      expect(result, false);
    });

    test(
        'selectCalendarListInMonth() 해당 연도, 월에 저장된 캘린더를 가져온다. 성공시, 캘린더 모델의 리스트를 리턴한다.',
        () async {
      const year = 2023;
      const month = 12;

      final mockEntities = List.generate(
          10,
          (index) =>
              getMockCalendarEntity().copyWith(date: DateTime(year, month)));

      when(dao.selectCalendarListInMonth(year, month))
          .thenAnswer((_) async => mockEntities);

      final result = await repository.selectCalendarListInMonth(year, month);

      for (int i = 0; i < (result?.length ?? 0); i++) {
        expect(result?[i], mockEntities[i].toModel());
      }
    });

    test(
        'selectCalendarListInMonth() 해당 연도, 월에 저장된 캘린더를 가져온다. 실패시, null 값을 리턴한다.',
        () async {
      const year = 2023;
      const month = 12;

      when(dao.selectCalendarListInMonth(year, month))
          .thenThrow(Exception('조회 실패'));

      final result = await repository.selectCalendarListInMonth(year, month);

      expect(result, null);
    });

    test(
        'selectCalendarListInYear() 해당 연도에 저장된 캘린더를 가져온다. 성공시, 캘린더 모델의 리스트를 리턴한다.',
        () async {
      const year = 2023;

      final mockEntities = List.generate(10,
          (index) => getMockCalendarEntity().copyWith(date: DateTime(year)));

      when(dao.selectCalendarListInYear(year))
          .thenAnswer((_) async => mockEntities);

      final result = await repository.selectCalendarListInYear(year);

      for (int i = 0; i < (result?.length ?? 0); i++) {
        expect(result?[i], mockEntities[i].toModel());
      }
    });

    test('selectCalendarListInYear() 해당 연도에 저장된 캘린더를 가져온다. 실패시, null 값을 리턴한다.',
        () async {
      const year = 2023;

      when(dao.selectCalendarListInYear(year)).thenThrow('조회 실패');

      final result = await repository.selectCalendarListInYear(year);

      expect(result, null);
    });

    test('selectCalendarWithDay() 해당 날짜에 저장된 캘린더를 가져온다. 성공시, 캘린더 모델을 리턴한다.',
        () async {
      final date = faker.date.dateTime();

      final calendarEntity = getMockCalendarEntity();

      when(dao.selectCalendarOfDate(date))
          .thenAnswer((_) async => calendarEntity);

      final result = await repository.selectCalendarWithDay(date);

      expect(result, calendarEntity.toModel());
    });

    test('selectCalendarWithDay() 해당 날짜에 저장된 캘린더를 가져온다. 실패시, null 값을 리턴한다.',
        () async {
      final date = faker.date.dateTime();

      when(dao.selectCalendarOfDate(date)).thenThrow(Exception('조회 실패'));

      final result = await repository.selectCalendarWithDay(date);

      expect(result, null);
    });

    test('selectCalendarWithId() 해당 아이디로 저장된 캘린더를 가져온다. 성공시, 캘린더 모델을 리턴한다.',
        () async {
      final id = faker.randomGenerator.integer(1000000);

      final calendarEntity = getMockCalendarEntity();

      when(dao.selectCalendarWithId(id))
          .thenAnswer((_) async => calendarEntity);

      final result = await repository.selectCalendarWithId(id);

      expect(result, calendarEntity.toModel());
    });

    test('selectCalendarWithId() 해당 아이디로 저장된 캘린더를 가져온다. 실패시 null 값을 리턴한다.',
        () async {
      final id = faker.randomGenerator.integer(1000000);

      when(dao.selectCalendarWithId(id)).thenThrow(Exception('조회 실패'));

      final result = await repository.selectCalendarWithId(id);

      expect(result, null);
    });
  });
}
