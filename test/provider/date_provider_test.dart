import 'package:dart_date/dart_date.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todaily/provider/date_provider.dart';
import 'package:flutter_todaily/util/const_value.dart';

void main() {
  group('[Provider] FirstDateProvider 테스트 :', () {
    test('선택 가능한 첫번째 날짜는 2022년 1월 1일이다.', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final firstDate = container.read(firstDateProvider);

      expect(DateTime(2022, 1, 1), firstDate);
    });
  });

  group('[Provider] LastDateProvider 테스트 :', () {
    test('선택 가능한 마지막 날짜는 올해로부터 5년 뒤 12월 31일이다.', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final lastDate = container.read(lastDateProvider);

      expect(DateTime(DateTime.now().year + maxYearTerm, 12, 31), lastDate);
    });
  });

  group('[Provider] SelectedDateProvider 테스트 :', () {
    test('처음으로 선택된 날짜는 오늘이다.', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final firstSelectedDate = container.read(selectedDateProvider);

      expect(DateTime.now().isSameDay(firstSelectedDate), true);
    });
  });
}
