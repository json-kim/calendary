import 'package:flutter_todaily/data/data_source/local/database/local_database.dart';
import 'package:flutter_todaily/data/data_source/local/mapper/calendar_mapper.dart';
import 'package:flutter_todaily/model/calendar_model.dart';
import 'package:collection/collection.dart';

extension CalendarListMapper on List<Calendar> {
  List<CalendarModel> toModelList() {
    return map((e) => e.toModel()).whereNotNull().toList();
  }
}
