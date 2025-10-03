import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/enums.dart';
import '../models/student.dart';
import '../repository/student_repository.dart';

final getStudentsProvider = StreamProvider.family<List<Student>, OrderMode>((
  Ref ref,
  OrderMode mode,
) {
  return ref.watch(studentRepositoryProvider).getStudents(mode: mode);
});
