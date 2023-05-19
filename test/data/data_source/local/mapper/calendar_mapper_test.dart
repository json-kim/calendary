import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todaily/data/data_source/local/database/local_database.dart';
import 'package:flutter_todaily/data/data_source/local/mapper/calendar_mapper.dart';
import 'package:flutter_todaily/model/calendar_model.dart';

import '../dao/calendars_dao_test.dart';

void main() {
  final Faker faker = Faker();

  group('(Mapper) CalendarModelMapper 테스트 :', () {
    test('toCompanion() 캘린더 모델을 DB에 저장하기 위한 객체로 변환한다.', () {
      final model = getMockCalendarModel();

      final companion = model.toCompanion();

      expect(companion.id.value, model.id);
      expect(companion.title.value, model.title);
      expect(companion.content.value, model.content);
      expect(companion.date.value, model.date);
      expect(companion.mood.value, model.mood);
    });
  });

  group('(Mapper) CalendarEntityMapper 테스트 :', () {
    test('toModel() 캘린더 엔티티를 캘린더 모델 객체로 변환한다.', () {
      final entity = getMockCalendarEntity();

      final model = entity.toModel();

      expect(model.id, entity.id);
      expect(model.title, entity.title);
      expect(model.content, entity.content);
      expect(model.date, entity.date);
      expect(model.mood, entity.mood);
    });
  });
}

CalendarModel getMockCalendarModel() => CalendarModel(
    id: faker.randomGenerator.integer(100000),
    title: faker.animal.name(),
    content: faker.company.name(),
    date: faker.date.dateTime(),
    mood: intToCalendarMood(Random().nextInt(5)));

Calendar getMockCalendarEntity() => Calendar(
    id: faker.randomGenerator.integer(100000),
    title: faker.animal.name(),
    content: faker.company.name(),
    date: faker.date.dateTime(),
    mood: intToCalendarMood(Random().nextInt(5)));
