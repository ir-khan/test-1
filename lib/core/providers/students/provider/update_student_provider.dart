import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/student.dart';
import '../repository/student_repository.dart';

part 'update_student_provider.g.dart';

@riverpod
Future<int> updateStudent(Ref ref, (int, Student) args) async {
  final (id, student) = args;
  return await ref.watch(studentRepositoryProvider).updateStudent(id, student);
}
