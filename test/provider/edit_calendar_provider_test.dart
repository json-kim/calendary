import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todaily/model/edit_calendar_model.dart';
import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';
import 'package:flutter_todaily/provider/date_provider.dart';
import 'package:flutter_todaily/provider/edit_calendar_provider.dart';
import 'package:flutter_todaily/provider/repository/calendar_repository_provider.dart';
import 'package:flutter_todaily/provider/selected_calendar_provider.dart';
import 'package:mockito/mockito.dart';

import '../data/data_source/local/mapper/calendar_mapper_test.dart';
import '../test_util/listener.dart';
import 'repository/calendar_repository_provider_test.mocks.dart';

void main() {
  final mockRepository = MockCalendarRepositoryType();
  final faker = Faker();
  group('[Provider] EditCalendarProvider 테스트 :', () {
    test('선택된 날짜의 캘린더가 존재하면 해당 캘린더로 캘린더 생성 모델이 만들어진다.', () {
      final calendar = getMockCalendarModel();
      final container = ProviderContainer(overrides: [
        calenarRepositoryProvider.overrideWithValue(mockRepository),
        selectedCalendarProvider.overrideWith((ref) => calendar)
      ]);
      addTearDown(container.dispose);

      final editCalendar = container.read(editCalendarProvider);

      expect(editCalendar.title, calendar.title);
      expect(editCalendar.content, calendar.content);
      expect(editCalendar.mood, calendar.mood);
      expect(editCalendar.date, calendar.date);
    });

    test('선택된 날짜의 캘린더가 존재하지 않으면 오늘 날짜의 비어있는 캘린더 생성 모델이 만들어진다.', () {
      final date = faker.date.dateTime();
      final container = ProviderContainer(overrides: [
        calenarRepositoryProvider.overrideWithValue(mockRepository),
        selectedCalendarProvider.overrideWith((ref) => null),
        selectedDateProvider.overrideWith((ref) => date),
      ]);
      addTearDown(container.dispose);

      final editCalendar = container.read(editCalendarProvider);

      expect(editCalendar.title, '');
      expect(editCalendar.content, '');
      expect(editCalendar.mood, CalendarMood.veryGood);
      expect(editCalendar.date, date);
    });

    test('날짜가 변경되면 캘린더 생성 모델도 새로 만들어진다.', () async {
      final date = faker.date.dateTime();
      final container = ProviderContainer(overrides: [
        calenarRepositoryProvider.overrideWithValue(mockRepository),
        selectedDateProvider.overrideWith((ref) => date),
      ]);
      addTearDown(container.dispose);

      final listner = Listener<EditCalendarModel>();
      container.listen(editCalendarProvider, listner, fireImmediately: true);

      container.read(editCalendarProvider);
      final emptyEditCalendar = EditCalendarModel(
          title: '', content: '', mood: CalendarMood.veryGood, date: date);
      verify(listner(null, emptyEditCalendar));

      final newDate = faker.date.dateTime();
      container.updateOverrides([
        calenarRepositoryProvider.overrideWithValue(mockRepository),
        selectedDateProvider.overrideWith((ref) => newDate),
      ]);
      final calendar = getMockCalendarModel();
      when(mockRepository.selectCalendarWithDay(newDate))
          .thenAnswer((_) async => calendar);
      container.read(selectedDateProvider.notifier).state = newDate;
      await container.read(selectedCalendarProvider.future);

      container.read(editCalendarProvider);
      verify(listner(
          emptyEditCalendar,
          EditCalendarModel(
              title: calendar.title,
              content: calendar.content,
              mood: calendar.mood,
              date: calendar.date)));
    });

    test('changeMood() 무드를 변경한다.', () {
      final container = ProviderContainer(overrides: [
        calenarRepositoryProvider.overrideWithValue(mockRepository),
      ]);
      addTearDown(container.dispose);

      final listner = Listener<CalendarMood>();
      container.listen(
          editCalendarProvider.select((value) => value.mood), listner,
          fireImmediately: true);

      final mood =
          CalendarMood.moodList[faker.randomGenerator.integer(5, min: 1)];
      container.read(editCalendarProvider.notifier).changeMood(mood);

      verify(listner(CalendarMood.veryGood, mood)).called(1);
      expect(container.read(editCalendarProvider).mood, mood);
    });

    test('chanegeTitle() 타이틀을 변경한다.', () {
      final container = ProviderContainer(overrides: [
        calenarRepositoryProvider.overrideWithValue(mockRepository),
      ]);
      addTearDown(container.dispose);

      final listener = Listener<String>();
      container.listen(
          editCalendarProvider.select((value) => value.title), listener);

      final title = faker.animal.name();
      container.read(editCalendarProvider.notifier).chanegeTitle(title);

      verify(listener('', title)).called(1);
      expect(container.read(editCalendarProvider).title, title);
    });

    test('changeContent() 내용을 변경한다.', () {
      final container = ProviderContainer(overrides: [
        calenarRepositoryProvider.overrideWithValue(mockRepository),
      ]);
      addTearDown(container.dispose);

      final listener = Listener<String>();
      container.listen(
          editCalendarProvider.select((value) => value.content ?? ''),
          listener);

      final content = faker.animal.name();
      container.read(editCalendarProvider.notifier).changeContent(content);

      verify(listener('', content)).called(1);
      expect(container.read(editCalendarProvider).content, content);
    });

    test('checkValidate() 유효성을 체크한다.', () {
      final container = ProviderContainer(overrides: [
        calenarRepositoryProvider.overrideWithValue(mockRepository),
      ]);
      addTearDown(container.dispose);

      // 0자
      expect(
          container.read(editCalendarProvider.notifier).checkValidate(), false);

      // 1자
      container.read(editCalendarProvider.notifier).chanegeTitle('1');
      expect(
          container.read(editCalendarProvider.notifier).checkValidate(), false);

      // 2자
      container.read(editCalendarProvider.notifier).chanegeTitle('13');
      expect(
          container.read(editCalendarProvider.notifier).checkValidate(), true);
    });
  });
}
