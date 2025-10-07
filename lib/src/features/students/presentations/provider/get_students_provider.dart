import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'order_mode/order_mode_provider.dart';
import '../../data/models/student.dart';
import '../../data/repository/student_repository.dart';

part 'get_students_provider.g.dart';

@riverpod
Stream<List<Student>> getStudents(Ref ref) {
  return ref
      .watch(studentRepositoryProvider)
      .getStudents(mode: ref.watch(toggleOrderModeProvider));
}
