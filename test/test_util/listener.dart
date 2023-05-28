import 'package:mockito/mockito.dart';

class Listener<T> with Mock {
  void call(T? previous, T value);
}
