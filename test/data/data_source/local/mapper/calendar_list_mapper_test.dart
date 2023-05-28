import 'package:drift/drift.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todaily/data/data_source/local/database/local_database.dart';
import 'package:flutter_todaily/data/data_source/local/mapper/calendar_list_mapper.dart';
import 'package:flutter_todaily/model/calendar_model.dart';

import 'calendar_mapper_test.dart';

void main() {
  final Faker faker = Faker();

  group('(Mapper) CalendarListMapper 테스트 :', () {
    test('toModelList() 엔티티 리스트를 모델의 리스트로 변환한다.', () {
      final entities = List.generate(30, (index) => getMockCalendarEntity());

      final models = entities.toModelList();

      // 길이 체크
      expect(entities.length, models.length);

      // 각 항목 체크
      for (int i = 0; i < entities.length; i++) {
        final entity = entities[i];
        final model = models[i];

        expect(checkCalendarEntityModelSame(entity, model), true);
      }
    });
  });
}

bool checkCalendarEntityModelSame(Calendar entity, CalendarModel model) {
  return entity.id == model.id &&
      entity.title == model.title &&
      entity.content == model.content &&
      entity.date == model.date &&
      entity.mood == model.mood;
}
