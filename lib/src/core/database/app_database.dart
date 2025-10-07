import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/enums.dart';
import 'app_database.steps.dart';
import 'tables/departments.dart';
import 'tables/students.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Students, Departments])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: stepByStep(
        from1To2: (m, schema) async {
          await m.addColumn(schema.students, schema.students.grade);
          await m.alterTable(
            TableMigration(
              schema.students,
              columnTransformer: {
                schema.students.createdAt: DateTimeExpressions.fromUnixEpoch(
                  schema.students.createdAt.dartCast<int>(),
                ),
              },
            ),
          );
        },
        from2To3: (m, schema) async {
          await m.addColumn(schema.students, schema.students.fatherName);
          await m.alterTable(
            TableMigration(
              schema.students,
              columnTransformer: {
                schema.students.marks: schema.students.marks.cast<int>(),
              },
            ),
          );
          await m.createTable(schema.departments);
        },
        from3To4: (Migrator m, Schema4 schema) async {
          await m.addColumn(schema.students, schema.students.age);
        },
        from4To5: (Migrator m, Schema5 schema) async {
          await m.alterTable(
            TableMigration(
              schema.students,
              columnTransformer: {
                schema.students.age: schema.students.age.cast<int>(),
              },
            ),
          );
        },
      ),
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'students',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}

@riverpod
AppDatabase database(Ref _) => AppDatabase();
