import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/student.dart';
import '../repository/student_repository.dart';

final updateStudentProvider = FutureProvider.family<int, (int, Student)>((
  Ref ref,
  (int, Student) args,
) async {
  final (id, student) = args;
  return await ref.watch(studentRepositoryProvider).updateStudent(id, student);
});
