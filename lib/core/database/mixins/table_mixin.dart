import 'package:drift/drift.dart';

mixin TableMixin on Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
