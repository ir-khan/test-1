import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/enums.dart';
import '../../../../core/database/app_database.dart' hide Student;
import '../models/student.dart';
import 'impl/student_repository_impl.dart';

part 'student_repository.g.dart';

abstract class StudentRepository {
  final AppDatabase database;

  StudentRepository(this.database);

  Future<int> createStudent(Student student);

  Future<Student> getStudent(int id);

  Stream<List<Student>> getStudents({OrderMode mode = OrderMode.asc});

  Future<int> updateStudent(int id, Student student);

  Future<int> deleteStudent(int id);
}

@riverpod
StudentRepository studentRepository(Ref ref) {
  return StudentRepositoryImpl(ref.read(databaseProvider));
}
