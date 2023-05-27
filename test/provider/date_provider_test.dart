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
}
