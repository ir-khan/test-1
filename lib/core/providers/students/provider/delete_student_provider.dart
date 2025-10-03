import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/student_repository.dart';

final deleteStudentProvider = FutureProvider.family<int, int>((
  Ref ref,
  int id,
) async {
  return await ref.watch(studentRepositoryProvider).deleteStudent(id);
});
