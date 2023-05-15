import 'dart:math';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todaily/data/data_source/local/dao/calendars_dao.dart';
import 'package:flutter_todaily/data/data_source/local/database/local_database.dart';
import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';

void main() {
  late LocalDatabase database;
  late CalendarsDao dao;

  final calendarsCompanion = CalendarsCompanion.insert(
    title: '테스트 캘린더',
    mood: CalendarMood.good,
    date: DateTime(2023, 5, 14),
    content: const Value('테스트 캘린더 내용입니다.'),
  );

  Faker faker = Faker();

  group('[Dao] Calendars 테이블 dao 테스트 /', () {
    setUp(() {
      // 데이터 베이스(메모리) 설정
      database = LocalDatabase(nativeDatabase: NativeDatabase.memory());
      dao = CalendarsDao(database);
    });

    tearDown(() async {
      // 그룹 테스트 종료 후, 데이터베이스 닫기
      await database.close();
    });

    test('insertCalendar() Calendars 테이블에 새로운 캘린더를 삽입한다.', () async {
      addTearDown(() async => await dao.deleteCalendarAll());

      final id = await dao.insertCalendar(calendarsCompanion);

      final insertCalendar = await dao.selectCalendarWithId(id);

      expect(calendarsCompanion.copyWith(id: Value(id)),
          insertCalendar?.toCompanion(true));
    });

    test('deleteCalendar() Calendars 테이블에 캘린더를 삭제한다.', () async {
      addTearDown(() async => await dao.deleteCalendarAll());

      // 캘린더 삽입 체크
      final id = await dao.insertCalendar(calendarsCompanion);
      final insertCalendar = await dao.selectCalendarWithId(id);
      expect(insertCalendar == null, false);

      // 삭제된 캘린더 개수 체크
      final deleteCount = await dao.deleteCalendar(id);
      expect(deleteCount, 1);

      // 삭제 이후, 조회시 없는 것 체크
      final deletedCalendar = await dao.selectCalendarWithId(id);
      expect(deletedCalendar == null, true);
    });

    test('updateCalendar() Calendars 테이블에 캘린더 값을 변경한다.', () async {
      addTearDown(() async => await dao.deleteCalendarAll());

      // 캘린더 삽입 체크
      final id = await dao.insertCalendar(calendarsCompanion);
      final insertCalendar = await dao.selectCalendarWithId(id);
      expect(insertCalendar == null, false);

      const newTitle = '변경된 타이틀 입니다.';
      final newCalendar =
          insertCalendar?.toCompanion(true).copyWith(title: Value(newTitle));
      final updatedId = await dao.updateCalendar(newCalendar!);

      // 타이틀만 변경되었는지 체크
      final updatedCalendar = await dao.selectCalendarWithId(updatedId);

      expect(newCalendar.copyWith(id: Value(updatedId)),
          updatedCalendar?.toCompanion(true));
    });

    test('selectCalendarListInYear() Calendars 테이블에서 연도에 해당하는 캘린더만 가져온다.',
        () async {
      addTearDown(() async => await dao.deleteCalendarAll());

      const count2022 = 10;
      const count2023 = 20;
      const count2024 = 30;

      // 2022 캘린더 삽입
      for (int i = 0; i < count2022; i++) {
        final calendarCompanion =
            calendarsCompanion.copyWith(date: Value(DateTime(2022, 12, i + 1)));
        await dao.insertCalendar(calendarCompanion);
      }
      // 2023 캘린더 삽입
      for (int i = 0; i < count2023; i++) {
        final calendarCompanion =
            calendarsCompanion.copyWith(date: Value(DateTime(2023, 10, i + 1)));
        await dao.insertCalendar(calendarCompanion);
      }
      // 2024 캘린더 삽입
      for (int i = 0; i < count2024; i++) {
        final calendarCompanion =
            calendarsCompanion.copyWith(date: Value(DateTime(2024, 1, i + 1)));
        await dao.insertCalendar(calendarCompanion);
      }

      // 2022년 캘린더 개수 체크
      final calendars2022 = await dao.selectCalendarListInYear(2022);
      expect(calendars2022.length, count2022);

      // 2023 캘린더 개수 체크
      final calendar2023 = await dao.selectCalendarListInYear(2023);
      expect(calendar2023.length, count2023);

      // 2024 캘린더 개수 체크
      final calendar2024 = await dao.selectCalendarListInYear(2024);
      expect(calendar2024.length, count2024);
    });

    test('selectCalendarListInMonth() Calendars 테이블에서 달에 해당하는 캘린더만 가져온다.',
        () async {
      addTearDown(() async => await dao.deleteCalendarAll());

      const countMarch = 10;
      const countApril = 20;
      const countMay = 30;

      // 3월 캘린더 삽입
      for (int i = 0; i < countMarch; i++) {
        final calendarCompanion =
            calendarsCompanion.copyWith(date: Value(DateTime(2022, 3, i + 1)));
        await dao.insertCalendar(calendarCompanion);
      }
      // 4월 캘린더 삽입
      for (int i = 0; i < countApril; i++) {
        final calendarCompanion =
            calendarsCompanion.copyWith(date: Value(DateTime(2023, 4, i + 1)));
        await dao.insertCalendar(calendarCompanion);
      }
      // 5월 캘린더 삽입
      for (int i = 0; i < countMay; i++) {
        final calendarCompanion =
            calendarsCompanion.copyWith(date: Value(DateTime(2024, 5, i + 1)));
        await dao.insertCalendar(calendarCompanion);
      }

      // 3월 캘린더 개수 체크
      final calendarsMarch = await dao.selectCalendarListInMonth(3);
      expect(calendarsMarch.length, countMarch);

      // 4월 캘린더 개수 체크
      final calendarApril = await dao.selectCalendarListInMonth(4);
      expect(calendarApril.length, countApril);

      // 5월 캘린더 개수 체크
      final calendarMay = await dao.selectCalendarListInMonth(5);
      expect(calendarMay.length, countMay);
    });

    test('selectCalendarOfDate() Calendars 테이블에서 특정한 날에 해당하는 캘린더를 가져온다.',
        () async {
      addTearDown(() async => await dao.deleteCalendarAll());

      final dummyData = List.generate(
          100,
          (index) => CalendarsCompanion.insert(
              title: faker.person.name(),
              content: Value(faker.animal.name()),
              mood: intToCalendarMood(Random().nextInt(5)),
              date: faker.date.dateTime()));

      final ids = await Future.wait(
          dummyData.map((e) async => await dao.insertCalendar(e)));

      for (int i = 0; i < dummyData.length; i++) {
        final dummy = dummyData[i];
        final insertedCalendar =
            await dao.selectCalendarOfDate(dummy.date.value);

        expect(insertedCalendar?.toCompanion(true),
            dummy.copyWith(id: Value(ids[i])));
      }
    });

    test('selectCalendarWithId() Calendars 테이블에서 id를 가지고 캘린더를 가져온다.', () async {
      addTearDown(() async => await dao.deleteCalendarAll());

      final dummyData = List.generate(
          100,
          (index) => CalendarsCompanion.insert(
              title: faker.person.name(),
              content: Value(faker.animal.name()),
              mood: intToCalendarMood(Random().nextInt(5)),
              date: faker.date.dateTime()));

      final ids = await Future.wait(
          dummyData.map((e) async => await dao.insertCalendar(e)));

      for (int i = 0; i < dummyData.length; i++) {
        final dummy = dummyData[i];
        final insertedCalendar = await dao.selectCalendarWithId(ids[i]);

        expect(insertedCalendar?.toCompanion(true),
            dummy.copyWith(id: Value(ids[i])));
      }
    });

    test('deleteCalendarAll() Calendars 테이블에서 모든 캘린더를 제거한다.', () async {
      addTearDown(() async => await dao.deleteCalendarAll());

      final dummyData = List.generate(
          100,
          (index) => CalendarsCompanion.insert(
              title: faker.person.name(),
              content: Value(faker.animal.name()),
              mood: intToCalendarMood(Random().nextInt(5)),
              date: faker.date.dateTime()));

      await Future.wait(
          dummyData.map((e) async => await dao.insertCalendar(e)));

      final deletedCount = await dao.deleteCalendarAll();

      expect(deletedCount, 100);
    });
  });
}

CalendarMood intToCalendarMood(int value) {
  switch (value) {
    case 0:
      return CalendarMood.bad;
    case 1:
      return CalendarMood.veryBad;
    case 2:
      return CalendarMood.normal;
    case 3:
      return CalendarMood.good;
    default:
      return CalendarMood.veryGood;
  }
}
