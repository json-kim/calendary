import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todaily/provider/date_of_month_provider.dart';
import 'package:flutter_todaily/provider/year_provider.dart';

void main() {
  group('[Provider] DateOfMonthProvider 테스트 /', () {
    test('2023년 달별 날짜수를 테스트한다.', () {
      final container = ProviderContainer();

      for (int i = 1; i < 13; i++) {
        final date = container.read(dateOfMonthProvider(i));

        expect(date, dates2023[i - 1]);
      }
    });

    test('2024년(윤년) 달별 날짜수를 테스트한다.', () {
      final container = ProviderContainer();

      container.read(yearProvider.notifier).nextYear();

      for (int i = 1; i < 13; i++) {
        final date = container.read(dateOfMonthProvider(i));

        expect(date, dates2024[i - 1]);
      }
    });
  });
}

const List<int> dates2023 = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
const List<int> dates2024 = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
