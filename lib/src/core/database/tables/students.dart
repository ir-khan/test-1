import 'package:drift/drift.dart';

import '../../../utils/enums.dart';
import '../mixins/table_mixin.dart';

class Students extends Table with TableMixin {
  TextColumn get name => text()();

  IntColumn get age => integer()();

  IntColumn get marks => integer()();

  BoolColumn get status => boolean()();

  TextColumn get grade =>
      textEnum<Grade>().withDefault(const Constant('notGraded'))();

  TextColumn get fatherName => text().withDefault(const Constant(''))();
}
