import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_calendar_model.freezed.dart';

part 'edit_calendar_model.g.dart';

@freezed
class EditCalendarModel with _$EditCalendarModel {
  const factory EditCalendarModel({
    required String title,
    required String? content,
    required CalendarMood mood,
    required DateTime date,
  }) = _EditCalendarModel;

  factory EditCalendarModel.fromJson(Map<String, Object?> json) =>
      _$EditCalendarModelFromJson(json);
}
