import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/enums.dart';
import '../../../data/students/dto/student_dto.dart';

part 'student.freezed.dart';

@freezed
abstract class Student with _$Student {
  const Student._();

  factory Student({
    int? id,
    required final String name,
    required final double marks,
    required final bool status,
    DateTime? createdAt,
    @Default(Grade.notGraded) final Grade grade,
  }) = _Student;

  StudentDto toDto() {
    return StudentDto(
      id: id,
      name: name,
      marks: marks,
      status: status,
      createdAt: createdAt,
      grade: grade,
    );
  }
}
