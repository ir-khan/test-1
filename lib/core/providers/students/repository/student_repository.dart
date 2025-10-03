import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../database/app_database.dart' hide Student;
import '../models/student.dart';
import 'impl/student_repository_impl.dart';

abstract class StudentRepository {
  final AppDatabase database;

  StudentRepository(this.database);

  Future<int> createStudent(Student student);

  Future<Student> getStudent(int id);

  Stream<List<Student>> getStudents();

  Future<int> updateStudent(int id, Student student);

  Future<int> deleteStudent(int id);
}

final studentRepositoryProvider = Provider(
  (ref) => StudentRepositoryImpl(ref.read(databaseProvider)),
);
