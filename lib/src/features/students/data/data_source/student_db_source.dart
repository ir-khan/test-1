import 'dart:developer';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../utils/enums.dart';
import '../dto/student_dto.dart';

class StudentDbSource {
  final AppDatabase database;

  StudentDbSource(this.database);

  Future<int> createStudent(StudentDto student) async {
    try {
      return await database.into(database.students).insert(student.toSchema());
    } catch (_) {
      rethrow;
    }
  }

  Future<StudentDto> getStudent(int id) async {
    try {
      final result = await (database.select(
        database.students,
      )..where((s) => s.id.equals(id))).getSingle();
      return result.toDto();
    } catch (_) {
      rethrow;
    }
  }

  Stream<List<StudentDto>> getStudents({
    required int cursor,
    int limit = 20,
    OrderMode mode = OrderMode.asc,
  }) {
    try {
      return (database.select(database.students)
            ..orderBy([
              (s) => OrderingTerm(
                expression: s.id,
                mode: switch (mode) {
                  OrderMode.asc => OrderingMode.asc,
                  OrderMode.desc => OrderingMode.desc,
                },
              ),
            ])
            ..where((s) => s.id.isBiggerThanValue(cursor))
            ..limit(limit))
          .watch()
          .map((students) => students.map((s) => s.toDto()).toList());
    } catch (_) {
      rethrow;
    }
  }

  Future<int> updateStudent(int id, StudentDto student) async {
    try {
      return (database.update(
        database.students,
      )..where((s) => s.id.equals(id))).write(student.toSchema());
    } catch (_) {
      rethrow;
    }
  }

  Future<int> deleteStudent(int id) async {
    try {
      return (database.delete(
        database.students,
      )..where((s) => s.id.equals(id))).go();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> storeBatchStudentRecords() async {
    for (var i = 30000; i < 45000; i++) {
      try {
        log('Inserting $i record');
        createStudent(
          StudentDto(
            name: 'Student ${i + 1}',
            marks: i,
            age: i % 20,
            status: i % 2 == 0,
            grade: i % 2 == 0 ? Grade.a : Grade.aPlus,
            fatherName: 'FatherName : ${i + 1}',
          ),
        );
      } catch (e) {
        log('Exception : $e');
      }
    }
  }
}

extension StudentDTOConverter on Student {
  StudentDto toDto() {
    return StudentDto(
      id: id,
      name: name,
      marks: marks,
      age: age,
      status: status,
      grade: grade,
      fatherName: fatherName,
      createdAt: createdAt,
    );
  }
}
