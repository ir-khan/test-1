import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/student.dart';
import '../repository/student_repository.dart';

final createStudentProvider = FutureProvider.family<int, Student>((
  Ref ref,
  Student student,
) async {
  return await ref.watch(studentRepositoryProvider).createStudent(student);
});
