import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/student.dart';
import '../repository/student_repository.dart';

final getStudentProvider = FutureProvider.family<Student, int>((
  Ref ref,
  int id,
) async {
  final res = await ref.watch(studentRepositoryProvider).getStudent(id);
  return res;
});
