import 'package:drift/drift.dart' hide JsonKey;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/enums.dart';
import '../../../database/app_database.dart' as db;
import '../../../providers/students/models/student.dart';

part 'student_dto.freezed.dart';

@freezed
abstract class StudentDto with _$StudentDto {
  const StudentDto._();

  const factory StudentDto({
    final int? id,
    required final String name,
    required final double marks,
    required final bool status,
    final DateTime? createdAt,
    required final Grade grade,
  }) = _StudentDto;

  db.StudentsCompanion toSchema() {
    return db.StudentsCompanion(
      id: (id == null ? Value.absent() : Value(id!)),
      createdAt: (createdAt == null ? Value.absent() : Value(createdAt!)),
      name: Value(name),
      marks: Value(marks),
      status: Value(status),
      grade: Value(grade),
    );
  }

  Student toModel() {
    return Student(
      id: id,
      name: name,
      marks: marks,
      status: status,
      createdAt: createdAt,
      grade: grade,
    );
  }
}
