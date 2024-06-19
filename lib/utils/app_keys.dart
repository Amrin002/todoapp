import 'package:flutter/material.dart';

@immutable
class AppKeys {
  const AppKeys._();

  static const String dbTable = 'tasks';
  static const String idColumn = 'id';
  static const String titleColumn = 'title';
  static const String noteColumn = 'note';
  static const String timeColumn = 'time';
  static const String dateColumn = 'date';
  static const String categoryColumn = 'category';
  static const String isCompleted = 'isCompleted';
}