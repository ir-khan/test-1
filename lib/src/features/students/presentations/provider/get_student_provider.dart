import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/student.dart';
import '../../data/repository/student_repository.dart';

part 'get_student_provider.g.dart';

@riverpod
Future<Student> getStudent(Ref ref, int id) async {
  return await ref.watch(studentRepositoryProvider).getStudent(id);
}
