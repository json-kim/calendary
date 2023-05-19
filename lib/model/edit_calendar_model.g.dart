// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_calendar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EditCalendarModel _$$_EditCalendarModelFromJson(Map<String, dynamic> json) =>
    _$_EditCalendarModel(
      title: json['title'] as String,
      content: json['content'] as String,
      mood: $enumDecode(_$CalendarMoodEnumMap, json['mood']),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_EditCalendarModelToJson(
        _$_EditCalendarModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'mood': _$CalendarMoodEnumMap[instance.mood]!,
      'date': instance.date.toIso8601String(),
    };

const _$CalendarMoodEnumMap = {
  CalendarMood.veryGood: 'veryGood',
  CalendarMood.good: 'good',
  CalendarMood.normal: 'normal',
  CalendarMood.bad: 'bad',
  CalendarMood.veryBad: 'veryBad',
};
