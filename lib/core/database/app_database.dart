import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../utils/enums.dart';
import 'tables/students.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Students])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

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
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'test_1',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}

final databaseProvider = Provider((ref) => AppDatabase());
