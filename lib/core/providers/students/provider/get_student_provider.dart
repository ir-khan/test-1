import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/student.dart';
import '../repository/student_repository.dart';

part 'get_student_provider.g.dart';

@riverpod
Future<Student> getStudent(Ref ref, int id) async {
  return await ref.watch(studentRepositoryProvider).getStudent(id);
}
