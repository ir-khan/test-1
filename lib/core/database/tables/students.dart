import 'package:drift/drift.dart';
import '../../../utils/enums.dart';
import '../mixins/table_mixin.dart';

class Students extends Table with TableMixin {
  TextColumn get name => text()();
  RealColumn get marks => real()();
  BoolColumn get status => boolean()();
  TextColumn get grade =>
      textEnum<Grade>().withDefault(const Constant('notGraded'))();
}
