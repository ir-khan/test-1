import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/enums.dart';
import 'tables/departments.dart';
import 'tables/students.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Students, Departments])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          await m.addColumn(students, students.grade);
          await m.alterTable(
            TableMigration(
              students,
              columnTransformer: {
                students.createdAt: DateTimeExpressions.fromUnixEpoch(
                  students.createdAt.dartCast<int>(),
                ),
              },
            ),
          );
        }
        if (from < 3) {
          await m.addColumn(students, students.fatherName);
          await m.alterTable(
            TableMigration(
              students,
              columnTransformer: {students.marks: students.marks.cast<int>()},
            ),
          );
          await m.createTable(departments);
        }
      },
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
