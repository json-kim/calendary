// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalendarModel _$$_CalendarModelFromJson(Map<String, dynamic> json) =>
    _$_CalendarModel(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String?,
      date: DateTime.parse(json['date'] as String),
      mood: $enumDecode(_$CalendarMoodEnumMap, json['mood']),
    );

Map<String, dynamic> _$$_CalendarModelToJson(_$_CalendarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'date': instance.date.toIso8601String(),
      'mood': _$CalendarMoodEnumMap[instance.mood]!,
    };

const _$CalendarMoodEnumMap = {
  CalendarMood.veryGood: 'veryGood',
  CalendarMood.good: 'good',
  CalendarMood.normal: 'normal',
  CalendarMood.bad: 'bad',
  CalendarMood.veryBad: 'veryBad',
};
