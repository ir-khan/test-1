import 'package:drift/drift.dart' hide JsonKey;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/database/app_database.dart' as db;
import '../../../../utils/enums.dart';
import '../models/student.dart';

part 'student_dto.freezed.dart';

@freezed
abstract class StudentDto with _$StudentDto {
  const StudentDto._();

  const factory StudentDto({
    final int? id,
    required final String name,
    required final int marks,
    required final int age,
    required final bool status,
    final DateTime? createdAt,
    required final Grade grade,
    required final String fatherName,
  }) = _StudentDto;

  db.StudentsCompanion toSchema() {
    return db.StudentsCompanion(
      id: id == null ? Value.absent() : Value(id!),
      createdAt: createdAt == null ? Value.absent() : Value(createdAt!),
      name: Value(name),
      age: Value(age),
      marks: Value(marks),
      status: Value(status),
      grade: Value(grade),
      fatherName: Value(fatherName),
    );
  }

  Student toModel() {
    return Student(
      id: id,
      name: name,
      marks: marks,
      age: age,
      status: status,
      createdAt: createdAt,
      grade: grade,
      fatherName: fatherName,
    );
  }
}
