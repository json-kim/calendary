import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todaily/model/calendar_model.dart';
import 'package:flutter_todaily/provider/date_provider.dart';
import 'package:flutter_todaily/provider/repository/calendar_repository_provider.dart';
import 'package:flutter_todaily/provider/selected_calendar_provider.dart';
import 'package:mockito/mockito.dart';

import '../data/data_source/local/mapper/calendar_mapper_test.dart';
import '../test_util/listener.dart';
import 'repository/calendar_repository_provider_test.mocks.dart';

// class CalendarModelListener with Mock {
//   void call(int? previous, int value);
// }

void main() {
  final faker = Faker();
  final mockRepository = MockCalendarRepositoryType();

  group('[Provider] SelectedCalendarProvider 테스트 :', () {
    test('저장된 날짜가 없으면 null 값을 가져온다.', () async {
      final container = ProviderContainer(overrides: [
        calenarRepositoryProvider.overrideWithValue(mockRepository),
      ]);
      addTearDown(container.dispose);
      final listener = Listener<AsyncValue<CalendarModel?>>();
      container.listen(selectedCalendarProvider, listener,
          fireImmediately: true);

      final model = await container.read(selectedCalendarProvider.future);

      verify(listener(const AsyncLoading(), const AsyncData(null))).called(1);
      expect(model, null);
    });

    test('날짜가 변경될 때마다 캘린더 정보를 다시 가져온다.', () async {
      final container = ProviderContainer(overrides: [
        calenarRepositoryProvider.overrideWithValue(mockRepository),
      ]);
      addTearDown(container.dispose);
      final listener = Listener<AsyncValue<CalendarModel?>>();
      final newDate = faker.date.dateTime();
      final newModel = getMockCalendarModel();
      when(mockRepository.selectCalendarWithDay(newDate))
          .thenAnswer((_) async => newModel);

      container.listen(selectedCalendarProvider, listener,
          fireImmediately: true);
      verify(listener(null, const AsyncLoading())).called(1);
      await container.read(selectedCalendarProvider.future);
      verify(listener(const AsyncLoading(), const AsyncData(null))).called(1);

      container.read(selectedDateProvider.notifier).state = newDate;
      final model = await container.read(selectedCalendarProvider.future);
      verify(listener(
              const AsyncLoading<CalendarModel?>()
                  .copyWithPrevious(const AsyncData(null), isRefresh: false),
              AsyncValue.data(newModel)))
          .called(1);
      expect(model, newModel);
    });
  });
}
