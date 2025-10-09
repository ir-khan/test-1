import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/student.dart';
import '../../data/repository/student/student_repository.dart';

part 'create_student_provider.g.dart';

@riverpod
Future<int> createStudent(Ref ref, Student student) async {
  return await ref.watch(studentRepositoryProvider).createStudent(student);
}
