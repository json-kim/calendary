import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_model.freezed.dart';

part 'calendar_model.g.dart';

@freezed
class CalendarModel with _$CalendarModel {
  const factory CalendarModel({
    required int id,
    required String title,
    required String? content,
    required DateTime date,
    required CalendarMood mood,
  }) = _CalendarModel;

  factory CalendarModel.fromJson(Map<String, Object?> json) =>
      _$CalendarModelFromJson(json);
}
