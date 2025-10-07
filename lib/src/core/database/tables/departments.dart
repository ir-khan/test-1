import 'package:drift/drift.dart';
import '../mixins/table_mixin.dart';

class Departments extends Table with TableMixin {
  TextColumn get name => text()();
}
